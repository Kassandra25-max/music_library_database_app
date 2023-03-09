require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "POST /albums" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = post('/albums', title: "Voyage", release_year: "2022", artist_id: "2")

      expect(response.status).to eq(200)
      expect(response.body).to eq("")

      response = get('/albums')

      expect(response.body).to include("Voyage")
    end
  end

  context "GET /albums" do
    it 'reuturns 200' do
      response = get('/albums')

      expected_response = 'Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover, Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, Ring Ring, Voyage'

      expect(response.status).to eq(200)
      expect(response.body).to eq(expected_response)
    end
  end
end
