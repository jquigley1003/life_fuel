class EventsController < ApplicationController


  def search
    @results = Event.party(params[:event], params[:location],
                          params[:time], params[:category])
    @twitter_results = Event.twitter_search(response)
  end
  
  # GET /events
  # GET /events.json
  def index
    party_results = Event.party(params[:event], params[:location],
                          params[:time], params[:category])
    @results = JSON.parse(party_results)

    # twitter_results = Event.twitter_search(params[:event])
    # @twitter_results = Event.twitter_search(response)
    # Event.create
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find_by(id: params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    if @event.save
      # redirect_to favorite_path(@event.id), notice: "You added an event to your favorites"
      current_user.events << @event
      redirect_to favorites_path, notice: "You added an event to your favorites"
    else
      render 'new'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to favorites_path notice: "You deleted an event from your favorites"
  end

  def twitter_search
    twitter_results = nil
  end

    private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_event
  #     @event = Event.find(params[:id])
  #   end

    def event_params
      params.require(:event).permit(:title, :venue_id, :location, :date, :description)
    end
end
