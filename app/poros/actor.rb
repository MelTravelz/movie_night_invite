class Actor
  attr_reader :name,
              :character,
              :id
              
  def initialize(response)
    @name      = response[:name]
    @character = response[:character]
    @id        = response[:id]
  end
end