class CreateLeaveDefinations < ActiveRecord::Migration
  def change
    create_table :leave_definations do |t|
      t.string :leave_name
      t.string :short_name
      t.boolean :allotment_yn
      t.boolean :affect_sal_yn

      t.timestamps
    end
  end
end
