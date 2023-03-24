class Movie
  attr_reader :movie_id,
              :title,
              :vote_avg,
              :runtime,
              :summary,
              :genres
  
  def initialize(response)
    # require 'pry'; binding.pry
    @movie_id = response[:movie][:id]
    @title = response[:movie][:title]
    @vote_avg = response[:movie][:vote_average]
    
    @runtime = response[:movie][:runtime]
    @summary = response[:movie][:overview]
    @genres = response[:movie][:genres]

    # @cast = response
  end
  
  # def list_genres
  #   genres.map do |g|
  #     g[:name]
  #   end
  # end
end