class StaticPagesController < ApplicationController
  def landing
  	redirect_to events_path if user_signed_in?
  end
end
