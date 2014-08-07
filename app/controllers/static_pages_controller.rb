class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: :private

  def home

  end

  def logged_in

  end

  def private
    if current_user.oauth_token
      graph = Koala::Facebook::GraphAPI.new(current_user.oauth_token)
      @user_info = graph.get_object("me")
      @friends = graph.get_connections("me", "friends")
    end

    @client = GooglePlaces::Client.new(ENV['google_places'])
    # @restaurantes = @client.spots(40.434362, -3.798356, :types => ['restaurant'])
    @restaurantes = @client.spots_by_query('kaprika, en pozuelo de alarcon')

  end


end
