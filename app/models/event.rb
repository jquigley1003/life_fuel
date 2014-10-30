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
    
end
