class SeatAllotmentsController < ApplicationController
  load_resource :only => [:show, :update, :edit, :destroy, :new ]
  authorize_resource
  
  def index
    page = params[:page].present? ? params[:page] : 1
    sort_by = params[:sort_by].present? ? params[:sort_by] : "dept"
    if params[:search_term].present?
      @seat_allotments = SeatAllotment.where(:dept => params[:search_term]).paginate(:page => 1)
    else
      @seat_allotments = SeatAllotment.all.order("#{sort_by} ASC").paginate(:page => page)
    end
  end

  def create
    if SeatAllotment.create(multi_allotment_params)
      flash.now[:success] = I18n.t :success, :scope => [:seat_allotment, :create]
      redirect_to seat_allotments_path
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:seat_allotment, :create]
      render "new"
    end
  end

  def update
    respond_to do |format|
      if @seat_allotment.update(seat_allotment_params)
        format.html { redirect_to @seat_allotment_params, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        #format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
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

  def new_allotment_upload
    @seat_allotment_uploader = SeatAllotmentUploader.new
    respond_to do |format|
      format.html { render "new_allotment_upload"}
      format.xlsx { send_data @seat_allotment_uploader.xls_template(col_sep: "\t") }
    end
  end

  def upload
    @seat_allotment_uploader = SeatAllotmentUploader.new(params[:seat_allotment_uploader])
    if @seat_allotment_uploader.save
      flash[:success] = I18n.t :success, :scope => [:seat_allotment, :upload]
      redirect_to seat_allotments_path
    else
      render "new_allotment_upload"
    end
  end


  private

  def seat_allotment_params
    params.require(:seat_allotment).permit(:dept, :semester, :exam_date, :roll_from, :roll_to, :room_no);
  end

  def multi_allotment_params
    multi_params = []
    f_params = params.require(:seat_allotment)
    (1..f_params[:total_rows].to_i).each do |index|
      if f_params["roll_from_#{index}".to_sym].present?
        multi_params << {:dept => f_params["dept_#{index}".to_sym], :semester => f_params["semester_#{index}".to_sym], :exam_date => f_params["exam_date_#{index}".to_sym], :roll_from => f_params["roll_from_#{index}".to_sym], :roll_to => f_params["roll_to_#{index}".to_sym], :room_no => f_params["room_no_#{index}".to_sym], :teacher => f_params["teacher_#{index}".to_sym]}
      end
    end
    multi_params
  end

end
