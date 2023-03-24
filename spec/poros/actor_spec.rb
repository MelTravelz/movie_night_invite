require 'rails_helper'

RSpec.describe Actor do
  let(:attributes) do
    {
      :id => 245,
      :name => "Keir Dullea",
      :character => "Dr. David Bowman"
    }
  end
  
  let(:actor) { Actor.new(attributes) }
  it 'exists and has attributes' do
    expect(actor).to be_an(Actor)
    expect(actor.id).to eq(245)
    expect(actor.name).to eq("Keir Dullea")
    expect(actor.character).to eq("Dr. David Bowman")
  end
end