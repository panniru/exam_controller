class HallOfFame < ActiveRecord::Base

	scope :search, lambda { |id| where(:id => id)}
	validates :avatar, :presence => true
	mount_uploader :avatar,  AvatarUploader
end
		
