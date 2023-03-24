require 'rails_helper'

RSpec.describe "/users/:user_id/movies/:movie_id" do
  describe "as a user, when I visit a movie's show page" do 
    before :each do
      @picard = User.create!(name: "Jean-Luc Picard", email: "captain@uss-enterprise.com")
    end

    xit "displays the movie information" do

      expect(page).to have_content("2001: A Space Odyssey")
    end
  end
end