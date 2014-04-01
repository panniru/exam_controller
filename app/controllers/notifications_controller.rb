class NotificationsController < ApplicationController
  def new
    @notification = Notification.new
  end
    
  def create
    @notification = Notification.new(params[:notification]) 
    if @notification.save
        flash[:notice] = 'Notification was successfully created.'
        format.html { redirect_to(@notification) }
        format.xml { render :xml => @notification, :status => :created, :location => @notification }
    else 
        format.html { render :action => "new" }
        format.xml { render :xml => @notification.errors, :status => :unprocessable_entity }
      end
    end
  
  def edit
    @notification = Notification.find(params[:id])
  end

  def show
    @notification = Notification.find(params[:id])
    respond_to do |format|
      format.html # show.html.haml
      format.xml { render :xml => @post }
 end
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy 
   
  end
  

  def index
    @notifications = Notification.find(:all)
  end
end
