class PdfResultsController < ApplicationController

  def pdf_upload
    @upload_pdf = UploadPdf.find(params[:pdf_id])
    # File.open(@upload_pdf.file_path_url) do |f|
    #        send_data f.read, :type => "application/pdf", :disposition => "inline"
    # end
  end

  def viewresult
    @upload_pdf = UploadPdf.find(params[:id])
    if @upload_pdf.file_path.present?
      File.open("./public"+"#{@upload_pdf.file_path}", 'rb') do |f|
        send_data f.read, :type => "application/pdf", :disposition => "inline"
      end
    else
      redirect_to pdf_results_path
    end
  end

  def upload_result_pdf
   @upload_pdf = UploadPdf.find(params[:pdf_id])
    
    if @upload_pdf.update(upload_pdf_params)
      redirect_to pdf_results_path
    else
      render "pdf_upload"
    end
  end


  private

  def upload_pdf_params
    params.require(:upload_pdf).permit(:department, :file_path)
  end
def show
  @upload_pdf = UploadPdf.find(params[:pdf_id])
end
def new
  @upload_pdf = UploadPdf.new
end
end

