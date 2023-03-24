require 'rails_helper'

RSpec.describe MoviedbFacade do
  describe "instance methods" do
    context "#initialize" do
      it "exists and can create a variable" do
        movie_facade = MoviedbFacade.new(search: "space")

        expect(movie_facade).to be_a(MoviedbFacade)
        expect(movie_facade.word).to eq("space")
      end
    end

    context "#movie_service" do
      it "returns instance of service object" do
        movie_facade = MoviedbFacade.new(search: "space")
            
        expect(movie_facade.movie_service).to be_a(MoviedbService)
      end
    end
    
    context "#get_movie_search" do
      it "returns array of movie objects" do
        search_results = File.read("spec/fixtures/moviedb/search_results.json")
        stub_request(:get, "https://api.themoviedb.org/search/movie?include_adult=false&query=space%20od")
        .to_return(status: 200, body: search_results, headers: {})
        
        film = MoviedbFacade.new(search: "space od")

        expect(film.get_movies_search).to be_an(Array)
        expect(film.get_movies_search.first).to be_a(Movie)
      end
    end

    context "#get_top_movies" do
      it "returns array of movie objects" do
        top_movies = File.read("spec/fixtures/moviedb/top_movies.json")
        stub_request(:get, "https://api.themoviedb.org/movie/top_rated?include_adult=false")
        .to_return(status: 200, body: top_movies, headers: {})
        
        film = MoviedbFacade.new(empty_string: "")
  
        expect(film.get_top_movies).to be_an(Array)
        expect(film.get_top_movies.first).to be_a(Movie)
      end
    end
    
    context "#get_movie_info" do
      it "returns a movie object" do
        response = File.read("spec/fixtures/moviedb/space_odyssey.json")
        stub_request(:get, "https://api.themoviedb.org/movie/62")
          .to_return(status: 200, body: response, headers: {})
          
        film = MoviedbFacade.new(movie_id: 62)
        
        expect(film.get_movie_info).to be_a(Movie)
      end
    end
  end
end