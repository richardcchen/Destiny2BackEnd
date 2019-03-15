@apiKey = Rails.application.credentials.api_key
@client_id = Rails.application.credentials.client_id
@client_secret = Rails.application.credentials.client_secret

class Api::V1::UsersController < ApplicationController
  def login
    @userObj = params[:userObj]

    membershipId = @userObj["userInfo"]["membershipId"]
    user = User.find_by(membershipId: membershipId)
  end

  def loginAuth
    redirect_to "https://www.bungie.net/en/OAuth/Authorize?client_id=25336&response_type=code"
  end

  def createuser
    User.create(
      displayName: params["username"],
      membershipId: params["newUserId"],
      membershipType: params["system"],
      charId1: params["newUserCharArray"][0],
      charId2: params["newUserCharArray"][1],
      charId3: params["newUserCharArray"][2],
      password: params["pw"]

    )
  end

  def token
    @code = params[:code]
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
    render json: {data: @code}
  end

  def addFriend
    userMembershipId = params[:userObj]["userInfo"]["membershipId"]
    friendId = params[:friendObj]["userInfo"]["membershipId"]
    friendSystem = params[:friendObj]["userInfo"]["membershipType"]
    displayName = params[:friendObj]["userInfo"]["displayName"]
    userId = User.find_by(membershipId: userMembershipId).id
    if Friend.exists?(membershipId: friendId, user_id: userId)
      puts "Already a Friend!"
    else
      Friend.create(
        user_id: userId,
        displayName: displayName,
        membershipId: friendId,
        system: friendSystem)
    end
  end

  def getFriends
    id = params[:userObj]["userInfo"]["membershipId"]
    friends = User.find_by(membershipId: id).friends
    render json: {data: friends}
  end

  def feed
    id = params["id"]
    comments = User.find_by(membershipId: id).comments
    render json: {data: comments}
  end

  def checkuser
    username = params["username"]
    pw = params["pw"]
    membershipType = params["system"]
    check = User.find_by("displayName": username)
    if check != nil
      result = "fail"
      if (check.password == pw) && (check.membershipType == membershipType)
        pw = "pass"
        render json: {data: result, password: pw}
      else
        pw = "fail"
        render json: {data: result, password: pw}
      end
    else
      result = "pass"
      render json: {data: result}
    end
  end


  private
  def user_params
    params.require(:user).permit(:membershipId, :membershipType, :charId1, :charId2, :charId3, :displayName)
  end


end
