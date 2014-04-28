class UploadPdf < ActiveRecord::Base
  belongs_to :upload_pdf
  
  mount_uploader :file_path,  AvatarUploader
  scope :search, lambda { |id| where(:id => id)}
end
