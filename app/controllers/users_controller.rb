class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @createdevents = current_user.events
  end

end
