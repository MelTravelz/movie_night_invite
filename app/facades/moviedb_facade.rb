# require 'ostruct'

class MoviedbFacade
  attr_reader :word,
              :movie_id
    
  def initialize(params)
    if params[:search].present?
      @word = params[:search] 
    elsif params[:movie_id].present?
      @movie_id = params[:movie_id]
    # else
    end
  end

  def movie_service
    @_movie_service ||= MoviedbService.new
  end

  def get_movies_search
    search_results = movie_service.fetch_api("/search/movie?query=#{@word}&include_adult=false")
    search_results[:results].map do |movie_hash|
      movie_list = { movie: movie_hash }
      Movie.new(movie_list)
    end
  end

  def get_top_movies
    search_results = movie_service.fetch_api("/movie/top_rated?include_adult=false")
    search_results[:results].map do |movie_hash|
      movie_list = { movie: movie_hash }
      Movie.new(movie_list)
    end
  end
  
  def get_cast
    search_results = movie_service.fetch_api("/movie/#{@movie_id}/credits?&include_adult=false")
    binding.pry
  end
  
  def get_movie_info
    info = movie_service.get_movie(@movie_id)
  end
  

  def get_specific_movie
    movie_list = {
      movie: get_movie_info
      # cast: get_cast_info
      # comments: get_comments_info
    }
    Movie.new(movie_list)
  end

  ############## REFACTORED: 
  #private <- for later muahaha

  # def get_movie_search(word)
  #   search_results = movie_service.fetch_api("/search/movie?query=#{word}&include_adult=false")
  #   search_results[:results].map do |movie|
  #     Movie.new(movie)
  #   end
  # end

  # def get_top_movies
  #   search_results = movie_service.fetch_api("/movie/top_rated?include_adult=false")
  #   search_results[:results].map do |movie|
  #     Movie.new(movie)
  #   end
  # end


  # def get_movies(keyword)
  #   top_20 = MoviedbService.fetch_api("")
  # end

  #####

  # def self.top_movie_info
  #   movie_list = {
  #     top_movies: get_top_movies # [{}]
  #   }
  #   # x = Movie.new(movie_list)
  #   require 'pry'; binding.pry
  # end
  
  # def initialize
  #   @movie_service = MoviedbService.new # could use memorization so it only uses resources when you need it
  # #   # make keyword an instance here (then can call it later in the view/controller)
  # end


end