class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :empname
      t.date :doj
      t.date :salartCalcFrom
      t.date :confirmationDate

      t.timestamps
    end
  end
end
