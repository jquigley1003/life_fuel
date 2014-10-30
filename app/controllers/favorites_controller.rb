class FavoritesController < ApplicationController
  def search
  end

  def show # Weird
    @user_favorites = current_user.events
  end

  def index
    @current_user_events = current_user.events
  end
end
