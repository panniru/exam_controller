class HowTosController < ApplicationController
  load_resource :only => [:show, :update, :edit, :destroy, :new]
  authorize_resource
  def index
    page = params[:page].present? ? params[:page] : 1
    if params[:search].present?
      @how_tos = HowTo.search(params[:search]).paginate(:page => 1)
    else
      @how_tos = HowTo.all.order("name").paginate(:page => page)
    end
  end

  def create
    @how_to = HowTo.new(how_to_params)
    if @how_to.save
      flash.now[:success] = I18n.t :success, :scope => [:how_to, :create]
      redirect_to how_tos_path
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:how_to, :create]
      render "new"
    end
  end

  def update
    if @how_to.update(how_to_params)
      flash.now[:success] = I18n.t :success, :scope => [:how_to, :update]
      redirect_to how_tos_path
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:how_to, :update]
      render "edit"
    end
  end

  def destroy
    if @how_to.destroy
      flash.now[:success] = I18n.t :success, :scope => [:how_to, :destroy]
      redirect_to how_tos_path
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:how_to, :destroy]
      render "show"
    end
  end

  private

  def how_to_params
    params.require(:how_to).permit(:name, :description, :fee)
  end

end
