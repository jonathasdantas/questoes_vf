class Answer < ActiveRecord::Base
	validates :answer,	:presence => true

	belongs_to :statement
	belongs_to :student
end
