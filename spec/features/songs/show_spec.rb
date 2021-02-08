require 'rails_helper'

RSpec.describe 'Songs Show Index Page' do
  describe  "As user visit /songs/1" do
    it "Show view display title and artist" do
      prince = Artist.create!(name: 'Prince')
      rtj = Artist.create!(name: 'Run The Jewels')

      beret = prince.songs.create!(title: 'Raspberry Beret', length: 345, play_count: 34)
      rain = prince.songs.create!(title: 'Purple Rain', length: 524, play_count: 19)

      legend = rtj.songs.create!(title: 'Legend Has It', length: 2301, play_count: 2300000)
      talk = rtj.songs.create!(title: 'Talk to Me', length: 2301, play_count: 2300000)

      visit "/songs/#{beret.id}"

      expect(page).to have_content(beret.title)
      expect(page).to have_content("Artist: #{prince.name}")
    end
  end
end
