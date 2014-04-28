class ResultsController < ApplicationController
  load_resource :only => [:show, :update, :edit, :destroy, :new]
  authorize_resource

  def index
    page = params[:page].present? ? params[:page] : 1
    if params[:course_name].present? and params[:semester].present?
      @course = Course.belongs_to_course(params[:course_name]).first
      if params[:year].present?
        @results = @course.results.belongs_to_current_user(current_user).belongs_to_year(params[:year]).paginate(:page => page)
      else
        @results = @course.results.belongs_to_current_user(current_user).paginate(:page => page)
      end
      @results = ResultsDecorator.decorate_collection(@results)
    end
  end

  def create
    @result = Result.new(result_params)
    if @result.save
      @result = ResultsDecorator.decorate(@result)
      flash.now[:success] = I18n.t :success, :scope => [:result, :create]
      render "show"
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:result, :create]
      render "new"
    end
  end

  def update
    if @result.update(result_params)
      @result = ResultsDecorator.decorate(@result)
      flash.now[:success] = I18n.t :success, :scope => [:result, :update]
      render "show"
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:result, :update]
      render "edit"
    end
  end

  def destroy
    if @result.destroy
      flash.now[:success] = I18n.t :success, :scope => [:result, :destroy]
      redirect_to results_path
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:result, :destroy]
      render "show"
    end
  end

  def result_upload
    @results_uploader = ResultsUploader.new
    respond_to do |format|
      format.html { render "new_upload"}
      format.xlsx { send_data @results_uploader.xls_template({col_sep: "\t"}, params) }
    end
  end
 
  def upload
    @results_uploader = ResultsUploader.new(params[:results_uploader])
    if @results_uploader.save
      flash[:success] = I18n.t :success, :scope => [:result, :upload]
      redirect_to results_path(:course_name => params[:results_uploader][:course_name], :semester => params[:results_uploader][:semester])
    else
      render "new_upload"
    end
  end

  private
  def result_params
    params.require(:result).permit(:student_id, :course_id, :year, :subject_1, :subject_2, :subject_3, :subject_4, :subject_5, :subject_6, :subject_7, :subject_8, :subject_9, :subject_10)
  end

end
