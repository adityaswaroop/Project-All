class Role < ActiveRecord::Base
  attr_accessible :role_type
  validates_format_of :role_type, :with => /^[\w\s]+$/i, :message => "should only contain letters and spaces"

  has_and_belongs_to_many :users, :validate => true, :uniq => true

end