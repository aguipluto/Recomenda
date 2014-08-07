class FacebookController < ApplicationController
  def get_friends
    if current_user.oauth_token
      graph = Koala::Facebook::GraphAPI.new(current_user.oauth_token)
      @user_info = graph.get_object("me")
      @friends = graph.get_connections("me", "friends")
    end
  end
end
