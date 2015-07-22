class Event < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  def self.party(event, location, time, category)
    event ||= "alternative&music"
    location ||= "atlanta"
    time ||= "future"
    category ||= "music"

    # Authentication key for eventful:
    # auth = { query: {  q: event, token: 'WE4XIBWZ5C4SVWP7JHK7' }} # Adds to end of URL ?apikey=<YOURKEY>&q=<event>
    #search_url = "https://www.eventbriteapi.com/v3/events/search/?q=#{event}&token=WE4XIBWZ5C4SVWP7JHK7"
    search_url = "http://api.eventful.com/json/events/search?&keywords=#{event}&location=#{location}&when=#{time}&category=#{category}&app_key=k4B7m8nzzBJskKrs"
    
    HTTParty.get search_url



    # auth = { query: { apikey: 'k4B7m8nzzBJskKrs' }}
    
    # id = # INSERT CODE HERE: Get the value of 'events' 0 'id' in the nested response hash
    #      # HINT: It should be something like this: response['stuff'][1]['morestuff']
    #      response["events"][0]["id"]
    # event_url = "http://api.rottentomatoes.com/api/public/v1.0/events/#{id}.json"

    # response = HTTParty.get event_url, auth
    
  end

  def self.twitter_search(twitter_find)
    #require 'rubygems'
    #require 'oauth'
    #require 'json'

    # Now you will fetch /1.1/search/tweets.json, which
    # takes a 'q' parameter and returns the
    # all Tweets based upon the search word.
    baseurl = "https://api.twitter.com"
    path    = "/1.1/search/tweets.json"
    query   = URI.encode_www_form("q" => "twitter_find")
    address = URI("#{baseurl}#{path}?#{query}")
    request = Net::HTTP::Get.new address.request_uri

    # Print data about a Tweet
    # def print_twitter_search(tweets)
    #   #puts JSON.pretty_generate(tweet)
    #   tweets.each do |tweet|
    #     puts tweet["text"]    
    #   end      
    # end

    # Set up HTTP.
    http             = Net::HTTP.new address.host, address.port
    http.use_ssl     = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    # The consumer key identifies the application making the request.
    # The access token identifies the user making the request.
    consumer_key = OAuth::Consumer.new(
    "inUyXeMuapT7ZaIgM3t333BIU",
    "tWNZ0LbNTP7nyI8mwRfAi80o37LAjdOOgMyuPoyB4oROE4RLJL")
    access_token = OAuth::Token.new(
    "22783757-FJX4hCp9qWJTcptTHVdvH5ePRTjlp83ogGsyACz38",
    "pyTbBCIIsVAGY91FrbXL8OJNKPknNqdMQDGS0JAT12vqh")

    # Issue the request.
    request.oauth! http, consumer_key, access_token
    http.start
    response = http.request request

    # Parse and print the Tweet if the response code was 200
    # tweets = nil
    # if response.code == '200' then
    #   tweets = JSON.parse(response.body)
    #   # print_twitter_search(tweets)
    # end
  end   
end
