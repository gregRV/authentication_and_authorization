require 'bcrypt'

class User < ActiveRecord::Base
  #TODO : Use bcrypt to store hashed passwords and authenticate users
  include BCrypt

  validates_presence_of :name, :email
  validates_uniqueness_of :email

  def password
  	@password ||= Password.new(password_hash)
  end

  def password=(new_password)
  	@password = Password.create(new_password)
  	self.password_hash = @password
  end
end
