class FeedbackController < ApplicationController
  def index
    @feedbacks = Feedback.all
  end

  def create
    @feedback = Feedback.new(feedback_params)  
    if @feedback.save
      flash.now[:success] = I18n.t :success, :scope => [:feedback, :create]
      render "index"
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:feedback, :create]
    end
  end

  def feedback_params
    params.require(:feedback).permit(:name, :email, :description)
  end
  
  
end

