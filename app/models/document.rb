class Document < ActiveRecord::Base
scope :search, lambda { |id| where(:id => id)}
#scope :belonging_to_document, lambda{|id| where(:document_id => id)}
 validates :filename, :presence => true
  mount_uploader :file_path,  AvatarUploader
end
#def self.search search_term
 # return scoped unless search_term.present? 
  #where(['filename LIKE ?', "%#{search_term}%"]) #project_name means the column name, change it to the correct name.
#end
