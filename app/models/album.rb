# == Schema Information
#
# Table name: albums
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  band_id        :integer          not null
#  recording_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Album < ActiveRecord::Base
  validates :name, :band_id, :recording_type, presence: true

  belongs_to :band

  has_many :tracks, dependent: :destroy

  RECORDING_TYPES = %w(studio live)

  def band_name
    self.band.name
  end

end
