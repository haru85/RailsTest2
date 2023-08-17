class UsersController < ApplicationController
  def show
    @user= User.find(params[:id])
    @mode = params[:mode]
  end
end
