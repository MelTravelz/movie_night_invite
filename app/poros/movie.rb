class Movie
  attr_reader :movie_id,
              :title,
              :vote_avg,
              :runtime,
              :summary,
              :genres
  
  def initialize(response)
    @movie_id = response[:id]
    @title = response[:title]
    @vote_avg = response[:vote_average]
    
    @runtime = response[:runtime]
    @summary = response[:overview]
    @genres = response[:genres]
  end
  
  # def list_genres
  #   genres.map do |g|
  #     g[:name]
  #   end
  # end
end