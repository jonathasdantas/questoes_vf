class Question < ActiveRecord::Base
	validates :statement,	:presence => true
							:length => { :minimum => 10 }

	belongs_to :test
	has_many :statements
end
