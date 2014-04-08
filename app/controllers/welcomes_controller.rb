class WelcomesController < ApplicationController
  load_resource :only => [:show, :update, :edit, :destroy, :new, :index]

  def index
    @welcomes = Welcome.all
  end
  
  def create
    @welcome = Welcome.new(welcome_params)
    if @welcome.save
      flash.now[:success] = I18n.t :success, :scope => [:welcome, :create]
      redirect_to welcomes_path
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:welcome, :create]
      render "new"
    end
  end
  
  def edit
    @welcome = Welcome.find(params[:id])
  end

  def destroy
    @welcome = Welcome.find(params[:id])
    @welcome.destroy
    respond_to do |format|
      format.html { redirect_to welcomes_url }
    end
  end
   private 
  
  def welcome_params
    params.require(:welcome).permit(:heading, :message)
  end
  
end
