class Api::V1::UsersController < ApplicationController
  def login
    User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:membershipId, :membershipType, :charId1, :charId2, :charId3, :displayName)
  end

end





#   def login
#   @user = User.find_by(user_params)
#   # byebug
#   if !@user
#     @user = {username: ""}
#   else
#     @videos = @user.videos
#   end
#   render json: {user: @user, videos: @videos}, status: :ok
# end
