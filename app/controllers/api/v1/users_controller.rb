@apiKey = Rails.application.credentials.api_key
@client_id = Rails.application.credentials.client_id
@client_secret = Rails.application.credentials.client_secret

class Api::V1::UsersController < ApplicationController
  def login
    @userObj = params[:userObj]
    displayName = @userObj["userInfo"]["displayName"]
    membershipId = @userObj["userInfo"]["membershipId"]
    membershipType = @userObj["userInfo"]["membershipType"]
    charId1 = @userObj["characterIds"][0]
    charId2 = @userObj["characterIds"][1]
    charId3 = @userObj["characterIds"][2]
    User.create_with(
      displayName: displayName,
      membershipId: membershipId,
      membershipType: membershipType,
      charId1: charId1,
      charId2: charId2,
      charId3: charId3
    ).find_or_create_by(membershipId: membershipId)
  end

  def loginAuth
    redirect_to "https://www.bungie.net/en/OAuth/Authorize?client_id=25336&response_type=code"
  end


  def token
    @code = params[:code]
    @client_id = "25336"
    @apiKey = Rails.application.credentials.api_key
    @client_id = Rails.application.credentials.client_id
    @secret = Rails.application.credentials.client_secret

  url = 'https://www.bungie.net/en/OAuth/Authorize/'
  # url = 'https://www.bungie.net/platform/app/oauth/token/'

  body = {grant_type: 'authorization_code', code: @code,
    client_id: @client_id, client_secret: @secret
  }
    # encoded_secret = Base64.encode64("25336:#{@secret}")
    headers = {
      content_type: 'application/x-www-form-urlencoded',
      # "X-API-KEY": '49519f8010794e44849099ed264ea631'
    }
    RestClient.post(url, body, headers)
  end

  def receivedToken
    byebug
    render json: {data: @code}
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
