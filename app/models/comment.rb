class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :content, length: { maximum: 400, message: "400 characters is the maximum allowed" }
end
