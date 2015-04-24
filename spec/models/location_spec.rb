require 'rails_helper'

describe Location do
  it 'Location#banner_selection' do
    @location = FactoryGirl.build(:location)
    2.times {@location.images << FactoryGirl.build(:image)}

    @location.images.first.showed = 1

    #stub scope to return our object
    allow(Location).to receive(:by_url).and_return([@location])

    expect(Location.banner_selection(@location.url)).to eq @location.images.last
  end
end