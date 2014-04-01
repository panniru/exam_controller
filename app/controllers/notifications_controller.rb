class NotificationsController < ApplicationController
  def new
    @notification = Notification.new
    respond_to do |format| 
      format.html # new.html.haml
      format.xml { render :xml => @notification } 
    end
    
  def create
    @notification = Notification.new(params[:notification]) 
    respond_to do |format| 
      if @notification.save
        flash[:notice] = 'Notification was successfully created.'
        format.html { redirect_to(@notification) }
        format.xml { render :xml => @notification, :status => :created, :location => @notification }
      else 
        format.html { render :action => "new" }
        format.xml { render :xml => @notification.errors, :status => :unprocessable_entity }
      end
    end
  end
  def edit
    @notification = Notification.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.html # show.html.haml
      format.xml { render :xml => @notification }
    end
  end
end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy 
    respond_to do |format| 
      format.html { redirect_to(notifications_url) } 
      format.xml { head :ok } 
    end
  end

  def index
    @notifications = Notification.find(:all)
    respond_to do |format| 
      format.html # index.html.haml
      format.xml { render :xml => @notifications }
    end
  end
end
