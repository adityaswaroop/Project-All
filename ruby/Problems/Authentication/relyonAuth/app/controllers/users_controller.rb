class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create, :roles_assign]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to landing_path, :notice => "Thank you for signing up! You are now logged in."
    else
      render :action => 'new'
    end
  end

  def roles_assign
    @users = User.all
    @roles = Role.all
    if params[:role]
      @users.each do |user|
        user.roles.clear
      end
      params[:role].each do |role_send|
        role_send_split = role_send.split('.')
        role_id = role_send_split[0]
        user_id = role_send_split[1]
        @user = User.find(user_id)
        @role = Role.find(role_id)
        @user.roles << @role
      end
      redirect_to users_roles_assign_path, :notice => "Successfully updated."
    end
  end
end
