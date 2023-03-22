require 'rails_helper'

RSpec.describe "/users/:id", type: :feature do
  describe "as a user, when I visit my user show page/dashboard" do 
    before :each do
      jan_1 = Date.parse("2023-01-01")
      jan_2 = Date.parse("2023-01-02")

      @picard = User.create!(name: "Jean-Luc Picard", email: "captain@uss-enterprise.com")
      @riker = User.create!(name: "William Riker", email: "number2@uss-enterprise.com")
      @data = User.create!(name: "Data", email: "data@uss-enterprise.com")

      @party1 = Party.create!(duration_minutes: 143, start_time: "08:00", date: jan_1, movie_id: 2001, host_id: @picard.id)
      @party2 = Party.create!(duration_minutes: 90, start_time: "09:30", date: jan_2, movie_id: 1999, host_id: @riker.id)

      PartyUser.create!(party_id: @party1.id, user_id: @picard.id, host_id: @party1.host_id)
      PartyUser.create!(party_id: @party1.id, user_id: @data.id, host_id: @party1.host_id)

      PartyUser.create!(party_id: @party2.id, user_id: @picard.id, host_id: @party2.host_id)
      PartyUser.create!(party_id: @party2.id, user_id: @riker.id, host_id: @party2.host_id)
      PartyUser.create!(party_id: @party2.id, user_id: @data.id, host_id: @party2.host_id)

      visit "/users/#{@picard.id}"
    end

    # User Story 3
    it "I see header, button to discover movies, a section that lists viewing parties" do
      expect(page).to have_content("Viewing Party")
      expect(page).to have_link("Home")

      expect(page).to have_content("#{@picard.name}'s Dashboard")
      expect(page).to have_button("Discover Movies")
      #how to test that I see an image from an API call? 

      expect(page).to have_content(@party1.start_time.strftime("%I:%M %p"))
      expect(page).to have_content(@party1.date.strftime("%B %-d, %Y"))
      
      expect(page).to have_content("Hosting")

      expect(page).to have_content(@party2.start_time)
      expect(page).to have_content(@party2.date)
      expect(page).to have_content("Invited")

      expect(page).to_not have_content("#{@riker.name}")
    end
  end
end