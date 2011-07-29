class LeaveDefinationsController < ApplicationController
  # GET /leave_definations
  # GET /leave_definations.json
  def index
    @leave_definations = LeaveDefination.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @leave_definations }
    end
  end

  # GET /leave_definations/1
  # GET /leave_definations/1.json
  def show
    @leave_defination = LeaveDefination.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @leave_defination }
    end
  end

  # GET /leave_definations/new
  # GET /leave_definations/new.json
  def new
    @leave_defination = LeaveDefination.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @leave_defination }
    end
  end

  # GET /leave_definations/1/edit
  def edit
    @leave_defination = LeaveDefination.find(params[:id])
  end

  # POST /leave_definations
  # POST /leave_definations.json
  def create
    @leave_defination = LeaveDefination.new(params[:leave_defination])

    respond_to do |format|
      if @leave_defination.save
        format.html { redirect_to @leave_defination, :notice => 'Leave defination was successfully created.' }
        format.json { render :json => @leave_defination, :status => :created, :location => @leave_defination }
      else
        format.html { render :action => "new" }
        format.json { render :json => @leave_defination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /leave_definations/1
  # PUT /leave_definations/1.json
  def update
    @leave_defination = LeaveDefination.find(params[:id])

    respond_to do |format|
      if @leave_defination.update_attributes(params[:leave_defination])
        format.html { redirect_to @leave_defination, :notice => 'Leave defination was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @leave_defination.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_definations/1
  # DELETE /leave_definations/1.json
  def destroy
    @leave_defination = LeaveDefination.find(params[:id])
    @leave_defination.destroy

    respond_to do |format|
      format.html { redirect_to leave_definations_url }
      format.json { head :ok }
    end
  end
end
