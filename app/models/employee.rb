require 'carrierwave/orm/activerecord'

class Employee < ActiveRecord::Base
  validates :name, :presence => true
  mount_uploader :avatar, AvatarUploader
end
