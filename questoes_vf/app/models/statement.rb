class Statement < ActiveRecord::Base
	validates :answer,	:presence => true

	belongs_to :question
	has_many :answers
end
