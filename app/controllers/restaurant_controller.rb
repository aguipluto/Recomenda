class RestaurantController < ApplicationController
  def google_search
    if params[:search]
      @client = GooglePlaces::Client.new(ENV['google_places'])
      # @restaurantes = @client.spots(40.434362, -3.798356, :types => ['restaurant'])
      @restaurantes = @client.spots_by_query(params[:search],:types => ['restaurant', 'cafe'])

      respond_to do |format|
        format.html
        format.js
      end
    end
  end
end
