class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_token
  has_many :questions
  has_many :answers
end
