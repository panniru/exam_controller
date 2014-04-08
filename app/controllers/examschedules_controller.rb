class ExamschedulesController < ApplicationController
  def index
    @examschedule = Examschedule.all
  end
  def create
    @examschedule = Examschedule.new(examschedule_params)
    if @examschedule.save
      flash[:success] = "Examshedule created!"
      redirect_to '/examschedules'
     else
      render 'new'
    end
  end
  def new
    @examschedule = Examschedule.new  		
  end
  def examschedule_params
    params.require(:examschedule).permit(:event, :courses, :subjects, :academic_year, :date, :timings )
  end
  def preview
    @examschedule = Examschedule.new(examschedule_params)
  end 
 
  

end
