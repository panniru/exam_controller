class NotificationsController < ApplicationController

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      flash.now[:success] = I18n.t :success, :scope => [:notification, :create]
      redirect_to root_path
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:notification, :create]
      render "new"
    end
  end

  def show
    @notification = Notification.find(params[:id])
  end
  def index
    @notifications = Notification.all
    
  end
  def new
    @notification=Notification.new
  end
  def edit
    @notification = Notification.find(params[:id])
  end
  def update
    @notification = Notification.find(params[:id])
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to root_path, notice: 'Notification was successfully updated.' }
       
      else
        format.html { render action: 'edit' }
       
      end
    end
  end
  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url }
      end
  end
  private
  def notification_params
    params.require(:notification).permit(:event, :description)
  end

end

