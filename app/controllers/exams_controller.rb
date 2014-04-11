class ExamsController < ApplicationController
	before_action :set_exam, only: [ :show, :edit, :update, :destroy]
  authorize_resource

	def index
    if params[:dept].present?
        @exams = Exam.where(:dept => params[:dept])
      else
        @exams = Exam.first.present? ? Exam.where(:dept => Exam.order("dept asc").first.dept) : []
     end
	end
  
  def show
    
  end

	def new
        @exam=Exam.new
    end

    def create
      @exam = Exam.new(exam_params)

      respond_to do |format|
        if @exam.save
          format.html { redirect_to @exam, notice: 'Exam Schedule was successfully created.' }
          #format.json { render action: 'show', status: :created, location: @exam }
        else
          format.html { render action: 'new' }
          #format.json { render json: @exam.errors, status: :unprocessable_entity }
        end
      end
    end

    def edit
        
    end

    def update
        
        respond_to do |format|
            if @exam.update(exam_params)
                format.html { redirect_to @exam, notice: 'Exam Schedule was successfully updated.' }
                format.json { head :no_content }
            else
                format.html { render action: 'edit' }
                #format.json { render json: @exam.errors, status: :unprocessable_entity }
            end
        end
    end


    def destroy

        @exam.destroy
        respond_to do |format|
          format.html { redirect_to exams_url }
          format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
        def set_exam
          @exam = Exam.find(params[:id])
        end

    # Never trust parameters from the scary internet, only allow the white list through.
        def exam_params
          params.require(:exam).permit(:dept, :semester, :subject, :date, :from, :to)
        end


end
