class DocumentsController < ApplicationController
  load_resource :only => [:show, :update, :edit, :destroy, :new]
  authorize_resource

  def index
   # @documents = Document.all
    page = params[:page].present? ? params[:page] : 1
    if params[:search].present?
      @documents = Document.search(params[:search])
    else
      @documents = Document.all.order("filename")
    end
  end
  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      flash.now[:success] = I18n.t :success, :scope => [:document, :create]
      redirect_to documents_path
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:document, :create]
      render "new"
    end
  end
  
  def show
    @document = Document.find(params[:id])
  end
  
  def download
    @document = Document.find(params[:id])
    send_file "#{Rails.root}/public"+@document.file_path_url
    
  end

  def edit
    @document = Document.find(params[:id]) 
    # @documentfilename = params[:file]
    # @document     = File.read(@documentfilename)
  end

  def update
    @document = Document.find(params[:id])
    if @document.update(document_params)
    else
    end
  end


  def manage_gallery
    @images = Document.where(:file_type => 'image')
  end

  def upload_gallery
    if params[:document].present?
      docs = []
      params[:document][:file_path].each do |file|
        Document.create!(:filename =>params[:document][:filename], :file_path => file, :file_type => params[:document][:file_type])
      end
    else
      flash.now[:fail] = I18n.t :success, :scope => [:document, :upload]
    end
    redirect_to manage_gallery_documents_path
  end
  
  def destroy
    if @document.destroy
      flash.now[:success] = I18n.t :success, :scope => [:document, :destroy]
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:student, :destroy]
    end
    redirect_to manage_gallery_documents_path
  end

  private
    
  def document_params
    params.require(:document).permit(:filename, :file_path)
  end
  
  
  
end
