class RolesController < ApplicationController
  #before_filter :login_required

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(params[:role])
    if @role.save
      redirect_to roles_path, :notice => "Role successfully created."
    else
      render :action => 'new'
    end
  end

  def index
    @roles = Role.all

    respond_to do |format|
      format.html # index.html.haml
      format.json { render json: @roles }
    end
  end

  def show
    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @role }
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to roles_path, notice: 'Role was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

end