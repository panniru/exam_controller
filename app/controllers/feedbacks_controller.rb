class FeedbacksController < ApplicationController
  load_resource :only => [:show, :update, :edit, :destroy, :new]
  authorize_resource
  def index
    page = params[:page].present? ? params[:page] : 1
    if params[:date].present?
      @feedbacks = Feedback.dated_on(params[:date]).paginate(:page => page)
    else
      @feedbacks = Feedback.all.paginate(:page => page)
    end
  end

  def create
    @feedback = Feedback.new(feedback_params)  
    respond_to do |format|
      if @feedback.save
        format.json do
          render :json => @feedback
        end
        format.html do
          flash.now[:success] = I18n.t :success, :scope => [:feedback, :create]
          render "index"
        end
      else
        format.json do
          render :json => "{status: 'fail'}"
        end
        format.html do
          flash.now[:fail] = I18n.t :fail, :scope => [:feedback, :create]
        end
      end
    end
  end

  def destroy
    if @feedback.destroy
      flash.now[:success] = I18n.t :success, :scope => [:feedback, :destroy]
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:feedback, :destroy]
    end
    redirect_to feedbacks_path
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :description)
  end
  
  
end

