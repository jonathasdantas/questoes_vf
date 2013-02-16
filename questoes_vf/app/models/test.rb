class Test < ActiveRecord::Base
	validates :title,	:presence => true
						:length => { :minimum => 6 }
						
	belongs_to :professor
	
	has_many :questions
	has_many :subjects
	
	has_and_belongs_to_many :students
end
