class SeatAllotmentsController < ApplicationController
  load_resource :only => [:show, :update, :edit, :destroy, :new ]
  authorize_resource
  
  def index
    page = params[:page].present? ? params[:page] : 1
    if params[:search].present?
      @seat_allotments = SeatAllotment.search(params[:search]).paginate(:page => 1)
    else
      @seat_allotments = SeatAllotment.all.order("name").paginate(:page => page)
    end
  end

  def create
    @seat_allotment = SeatAllotment.new(seat_allotment_params)
    if @seat_allotment.save
      flash.now[:success] = I18n.t :success, :scope => [:seat_allotment, :create]
      render "show"
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:seat_allotment, :create]
      render "new"
    end
  end

  def update
    if @seat_allotment.update(seat_allotment_params)
      flash.now[:success] = I18n.t :success, :scope => [:seat_allotment, :update]
      render "show"
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:seat_allotment, :update]
      render "edit"
    end
  end

  def destroy
    if @seat_allotment.destroy
      flash.now[:success] = I18n.t :success, :scope => [:seat_allotment, :destroy]
      redirect_to seat_allotments_path
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:seat_allotment, :destroy]
      render "show"
    end
  end

  private

  def seat_allotment_params
    params.require(:seat_allotment).permit(:name, :semester, :subject_1, :subject_2, :subject_3, :subject_4, :subject_5, :subject_6, :subject_7, :subject_8, :subject_9, :subject_10)
  end

end
