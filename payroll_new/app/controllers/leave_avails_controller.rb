class LeaveAvailsController < ApplicationController
  # GET /leave_avails
  # GET /leave_avails.json
  def index
    @leave_avails = LeaveAvail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @leave_avails }
    end
  end

  # GET /leave_avails/1
  # GET /leave_avails/1.json
  def show
    @leave_avail = LeaveAvail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @leave_avail }
    end
  end

  # GET /leave_avails/new
  # GET /leave_avails/new.json
  def new
    @leave_avail = LeaveAvail.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @leave_avail }
    end
  end

  # GET /leave_avails/1/edit
  def edit
    @leave_avail = LeaveAvail.find(params[:id])
  end

  # POST /leave_avails
  # POST /leave_avails.json
  def create
    @leave_avail = LeaveAvail.new(params[:leave_avail])

    respond_to do |format|
      if @leave_avail.save
        format.html { redirect_to @leave_avail, :notice => 'Leave avail was successfully created.' }
        format.json { render :json => @leave_avail, :status => :created, :location => @leave_avail }
      else
        format.html { render :action => "new" }
        format.json { render :json => @leave_avail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /leave_avails/1
  # PUT /leave_avails/1.json
  def update
    @leave_avail = LeaveAvail.find(params[:id])

    respond_to do |format|
      if @leave_avail.update_attributes(params[:leave_avail])
        format.html { redirect_to @leave_avail, :notice => 'Leave avail was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @leave_avail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /leave_avails/1
  # DELETE /leave_avails/1.json
  def destroy
    @leave_avail = LeaveAvail.find(params[:id])
    @leave_avail.destroy

    respond_to do |format|
      format.html { redirect_to leave_avails_url }
      format.json { head :ok }
    end
  end
end
