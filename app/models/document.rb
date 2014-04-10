class Document < ActiveRecord::Base
  validates :file_path, :presence => true

  scope :search, lambda { |id| where(:id => id)}

  validates :filename, :presence => true
  mount_uploader :file_path,  AvatarUploader
end
