class User < ActiveRecord::Base
	has_many :comments
	
    has_secure_password
    validates :email, presence: true, uniqueness: {case_sensitive: false}
end