require "pry"
# lib/user.rb

class User
  attr_accessor :email, :age
  @@all_users = []

  def initialize(email, age)
    @email = email
    @age = age
    @@all_users << self
  end

  def self.all
    @@all_users
  end

  def self.find_by_email(email)
    @@all_users.find { |user| user.email == email }
  end
end


