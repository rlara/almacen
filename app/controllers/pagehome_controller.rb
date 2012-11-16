class PagehomeController < ApplicationController
  def home
  end

  def users
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def block
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to pagehome_users_path
    end
  end
end
