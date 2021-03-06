# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Band.destroy_all
Album.destroy_all
Track.destroy_all

beatles = Band.create!(name: "The Beatles")
nirvana = Band.create!(name: "Nirvana")
zeppelin = Band.create!(name: "Led Zeppelin")
abbey = Album.create!(name: "Abbey Road",
                      band_id: beatles.id,
                      recording_type: "studio")
apple = Album.create!(name: "Apple",
                      band_id: beatles.id,
                      recording_type: "studio")
nevermind = Album.create!(name: "Nevermind",
                          band_id: nirvana.id,
                          recording_type: "studio")
zep1 = Album.create!(name: "Zeppelin 1",
                     band_id: zeppelin.id,
                     recording_type: "studio")
come_together = Track.create!(name: "Come Together", album_id: abbey.id, track_type: "regular", lyrics: "Here come old flattop")
octopus = Track.create!(name: "Octopus's Garden", album_id: abbey.id, track_type: "regular", lyrics: "I'd like to be, under the sea")
