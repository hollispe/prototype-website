require File.expand_path '../../server.rb', __FILE__
require 'rspec'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

describe 'Prototype App' do
  include Rack::Test::Methods
  
  def app() Sinatra::Application end
  
  it 'displays the homepage' do
    get '/'
    expect(last_response.status).to eq 200
  end
  
  it 'displays the company name: Lemon Unicorn Ltd.' do
    get '/'
    expect(last_response.body).to include "Lemon Unicorn Ltd."
  end
  
  it 'checks if the Jumbotron is working correctly' do
    get '/'
    expect(last_response.body).to include "How to be more agile?"
  end
  
end
