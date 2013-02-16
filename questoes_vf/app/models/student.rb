class Student < ActiveRecord::Base
	validates :redu_id,	:presence => true

	has_many :answers
	
	has_and_belongs_to_many :tests
end
