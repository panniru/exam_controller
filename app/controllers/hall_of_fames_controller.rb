class HallOfFamesController < ApplicationController
  load_resource :only => [:show, :update, :edit, :destroy, :new]
  skip_authorization_check 
  
  def index
    @hall_of_fames =HallOfFame.all
  end
  
  def new
    @hall_of_fame = HallOfFame.new
  end
  
  def create
    @hall_of_fame = HallOfFame.new(hall_of_fame_params)
    if @hall_of_fame.save
      flash.now[:success] = I18n.t :success, :scope => [:hall_of_fame, :create]
      redirect_to hall_of_fames_path
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:hall_of_fame, :create]
      render "new"
    end
  end
  
  def show
    @hall_of_fame = HallOfFame.find(params[:id])
  end

  def update
    if @hall_of_fame.update(hall_of_fame_params)
      flash.now[:success] = I18n.t :success, :scope => [:hall_of_fame, :update]
      redirect_to hall_of_fames_path
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:hall_of_fame, :update]
      render "edit"
    end
  end

  def destroy
    if @hall_of_fame.destroy
      flash.now[:success] = I18n.t :success, :scope => [:hall_of_fame, :destroy]
      redirect_to hall_of_fames_path
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:student, :destroy]
      render "show"
    end
  end

  private
  
  def hall_of_fame_params
    params.require(:hall_of_fame).permit(:name, :department, :year_of_passing, :avatar)
  end

end

