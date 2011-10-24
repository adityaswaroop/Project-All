class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create, :roles_assign]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.welcome_email(@user).deliver
      session[:user_id] = @user.id
      redirect_to landing_path, :notice => "Thank you for signing up! You are now logged in."
    else
      render :action => 'new'
    end
  end

  def roles_assign
    @users = User.all
    @roles = Role.all
    if params[:users]
      params[:users].each do |user|
        if user[:roles]
          @user = User.find(user[:id])
          @user.roles = Role.find(user[:roles])
        end
      end

      redirect_to users_roles_assign_path, :notice => "Successfully updated."
    end
  end
end
