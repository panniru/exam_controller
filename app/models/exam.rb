class Exam < ActiveRecord::Base
	validates :from, :presence => true
	validates  :to,:presence => true

 	def from
 	
 			read_attribute(:from).present? ? read_attribute(:from).strftime("%H:%M") : nil

  	end	

 	def to

 			read_attribute(:to).present? ? read_attribute(:to).strftime("%H:%M") :nil
 	end	

	def self.grouped_depts

  		Exam.select(:dept).group(:dept)
	end

end
