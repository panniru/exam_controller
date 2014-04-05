class NotificationsController < ApplicationController

  def create
    @notification = Notification.new(notification_params)
    if @notification.save
      flash.now[:success] = I18n.t :success, :scope => [:notification, :create]
      
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:notification, :create]
      render "new"
    end
  end
  private
  def notification_params
    params.require(:notification).permit(:event, :description)
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
end

