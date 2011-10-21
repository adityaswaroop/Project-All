class User < ActiveRecord::Base
  attr_accessible :name, :username, :email, :password
  validates_presence_of :name, :email, :username, :password
  validates_format_of :name, :with => /^[\w\s]+$/i, :message => "should only contain letters and spaces"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :message => "invalid email format"
  validates_uniqueness_of :email
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :message => "should only contain letters, numbers, or .-_@"
  validates_uniqueness_of :username
  validates_length_of :password, :minimum => 6, :message => "length should be greater than or equal to 6"

  has_and_belongs_to_many :roles, :validate => true, :uniq => true

  def self.authenticate(username, pass)
    user = (find_by_username(username) || find_by_email(username)) && find_by_password(pass)
    return user if user
  end


end
