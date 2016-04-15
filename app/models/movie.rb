class Movie < ActiveRecord::Base
	has_many :comments

  validates :title, uniqueness: true
end
