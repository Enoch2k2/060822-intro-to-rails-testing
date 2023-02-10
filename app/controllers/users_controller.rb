class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: 200
  end

  def create
    user = User.create(user_params)
    render json: user, status: 201
    # if user.valid?
    # end
  end

  private
    def user_params
      params.permit(:email, :first_name, :last_name, :password)
    end
end
