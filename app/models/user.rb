# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_confirmation, presence: true

  has_secure_password
  has_secure_token :api_key
end
