require 'rails_helper'
require 'spec_helper'
require 'elevator_media/Streamer'
require 'date'
require 'rest-client'
require 'open_weather'
require 'json'
require 'openssl'
require 'net/http'
require 'uri'

describe ElevatorMedia::Streamer do

    let!(:streamer){ElevatorMedia::Streamer.new}

    # Testing if a first basic test gives back a successful response
    it "a first test to initialize environment" do
        expect(true).to be true
    end

    # Testing if the required getContent method returns "interesting content"
    it "should receive a response from getContent" do
        expect(streamer).to respond_to(:getContent)        
    end
 
   # Testing the required getContent method and what it returns
    describe "getContent behavior" do
        # Testing if the getContent method returns 'weather' type data if asked
        it "should be able to fetch weather data" do
            expect(streamer).to receive(:getWeather) {'<div>weather</div>'}
            streamer.getContent('weather')
        end
    end
     # Test the response of the method : getMarketMover
     context "getMarketMover Test: Check the call of the method" do
        it "Test the call of the method getMarketMover ?" do
            html = streamer.getContent("MarketMover") 
            puts html
            expect(streamer).to respond_to(:getContent)  
            # expect(html).to_not eq(nil)
            # expect(html).to be_a(String)   
        end
    end


    

end