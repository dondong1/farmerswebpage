require 'rails_helper'
require 'elevator_media/Streamer'
require 'date'
require 'open_weather'
require 'rest-client'

module ElevatorMedia
  class Streamer

    def initialize
      @open_weather = ENV['open_weather_api']
    end

    
    def getContent(type)
        getHtmlFromCloud(type)
    end

    # method that returns a specific html depending on the "type" asked in the getContent method
    def getHtmlFromCloud(type)
     
      if type == 'weather'  
        return "<div class='elevator-media-streamer-content'>#{self.getWeather}</div>"  
      end 

      # if type == 'stock'
      #   return "<div class='elevator-media-streamer-content'>#{self.getMarketMover}</div>"
      # end 

    end

    # method that gets the weather for a specific city, Sacramento in this case
    def getWeather
      options = { units: "metric", APPID: @open_weather }
      OpenWeather::Current.city("Sacramento City, CA", options)
    end

    # method that gets the weather forecast for a selected city, in this case Sacramento city
    def getForecast
      options = { units: "metric", APPID: @open_weather }
      OpenWeather::Current.city("Sacramento City, CA", options)
    end

    def getMarketMover
      url = URL("https://yahoo-finance-low-latency.p.rapidapi.com/v11/finance/quoteSummary/AAPL?modules=defaultKeyStatistics%2CassetProfile")
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-key"] = '864b9d8b06mshcbc11ef7643fe25p1eacbejsnf31f86dfeb09'
      request["x-rapidapi-host"] = 'yahoo-finance-low-latency.p.rapidapi.com'
      response = http.request(request)
      puts response.read_body
      @output = JSON.parse(response.read_body)
      if @output.empty?
        return "Error"
      else
        return @output
      end
    end
  end

end