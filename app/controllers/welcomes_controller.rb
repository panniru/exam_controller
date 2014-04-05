class WelcomesController < ApplicationController
  def create
    @welcome = Welcome.new(welcome_params)
    if @welcome.save
      flash.now[:success] = I18n.t :success, :scope => [:notification, :create]
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:notification, :create]
      render "new"
    end
  end
   private 
  
  def welcome_params
    params.require(:welcome).permit(:heading, :message)
  end

  end

  def edit
  end

  def show
  end
end
