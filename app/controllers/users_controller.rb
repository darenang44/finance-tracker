class UsersController < ApplicationController
  def my_portfolio
    @user_stocks = current_user.stocks
    @user = current_user
  end

  def my_friends
    @friendships = current_user.friends
  end

  def search
    # we are going to find the user/friend by the search_params which is the input given in our search bar
    # search method is a class level method defined in user.rb
    @users = User.search(params[:search_param])

    if @users
      # we want all the users to show up expect our selves (current_user)
      @users = current_user.expect_current_user(@users)
      render partial: 'friends/lookup'
    else
      # if user is not found then nothing
      render status: :not_found, nothing: true
    end
  end

  def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)

    if current_user.save
      redirect_to my_friends_path, notice: "Friend was successfully added."
    else
      redirect_to my_friends_path, flash[:error] = "There was an error with adding friend"
    end
  end

end
