class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |r|
      r.string :role_type
      r.timestamps
    end
  end
end