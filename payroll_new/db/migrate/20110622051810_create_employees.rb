class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :employee_name
      t.date :doj
      t.date :salary_calculation_date
      t.date :confirmation_date

      t.timestamps
    end
  end
end
