require 'rails_helper'

RSpec.describe Actor do
  let(:attributes) do
    {
      :actor_id => 245,
      :name => "Keir Dullea",
      :character => "Dr. David Bowman"
    }
  end
  
  let(:actor) { Actor.new(attributes) }
  it 'exists and has attributes' do
    
  end
end