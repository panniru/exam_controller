class Document < ActiveRecord::Base
  validates :file_path, :presence => true
  belongs_to :document
  
  validates :filename, :presence => true
  mount_uploader :file_path,  DocumentUploader
  scope :search, lambda { |id| where(:id => id)}

  scope :document_types, -> {where("file_type != 'image' or file_type IS NULL" )}
end
