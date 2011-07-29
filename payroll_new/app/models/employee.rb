class Employee < ActiveRecord::Base
  validates_presence_of :employee_name, :doj

  has_many :leave_avail, :foreign_key => 'employee_name'

  scope :find_by_ref_starting_with, lambda { |arg| where("refno LIKE '#{arg}%'") }


  def chk_Employee
    if self.dol.nil?
      self.status = "Active"
    end
  end




end
