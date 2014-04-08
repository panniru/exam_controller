class WelcomesController < ApplicationController
  load_resource :only => [:show, :update, :edit, :destroy, :new]

  def index
    @welcomes = Welcome.all
  end
  
  def create
    @welcome = Welcome.new(welcome_params)
    if @welcome.save
      flash.now[:success] = I18n.t :success, :scope => [:notification, :create]
      redirect_to welcomes_path
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
