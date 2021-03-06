# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_id   :integer          not null
#  track_type :string           not null
#  lyrics     :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  validates :name, :album_id, :track_type, :lyrics, presence: true

  belongs_to :album

  TRACK_TYPES = %w(bonus regular)

  def album_name
    self.album.name
  end

  def band_name
    self.album.band_name
  end

end
