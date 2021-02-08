require 'rails_helper'

RSpec.describe 'Artists Index Page' do

  describe "When I visit ‘/artists’" do
    it 'Shows all the songs in the system' do
      prince = Artist.create!(name: 'Prince')
      rtj = Artist.create!(name: 'Run The Jewels')

      beret = prince.songs.create!(title: 'Raspberry Beret', length: 345, play_count: 34)
      rain = prince.songs.create!(title: 'Purple Rain', length: 524, play_count: 19)

      legend = rtj.songs.create!(title: 'Legend Has It', length: 2301, play_count: 2300000)
      talk = rtj.songs.create!(title: 'Talk to Me', length: 2301, play_count: 2300000)

      visit '/artists'

      expect(page).to have_content(prince.name)
      expect(page).to have_content(rtj.name)
    end
  end
end
