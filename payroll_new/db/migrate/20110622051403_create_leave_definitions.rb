class CreateLeaveDefinitions < ActiveRecord::Migration
  def change
    create_table :leave_definitions do |t|
      t.string :leave_name
      t.boolean :allotment
      t.boolean :affect_salary

      t.timestamps
    end
  end
end
