    require 'rubygems'
    require 'oauth'
    require 'json'

    # Now you will fetch /1.1/search/tweets.json, which
    # takes a 'q' parameter and returns the
    # all Tweets based upon the search word.
    baseurl = "https://api.twitter.com"
    path    = "/1.1/search/tweets.json"
    query   = URI.encode_www_form("q" => "foo fighters")
    address = URI("#{baseurl}#{path}?#{query}")
    request = Net::HTTP::Get.new address.request_uri

    # Print data about a Tweet
    def print_twitter_search(tweets)
      #puts JSON.pretty_generate(tweet)
      tweets.each do |tweet|
        puts tweet["text"]    
      end      
    end

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
    tweets = nil
    if response.code == '200' then
      tweets = JSON.parse(response.body)
      # print_twitter_search(tweets)
    end