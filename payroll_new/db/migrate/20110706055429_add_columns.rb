class AddColumns < ActiveRecord::Migration
  def self.up
    add_column :employees, :refno, :string
  end

#  def self.down
#    remove_column :leave_avail, :status
#  end

end