class CreateRolesUsers < ActiveRecord::Migration
  def change
    create_table :roles_users, :id => false do |ur|
      ur.integer :user_id
      ur.integer :role_id
      ur.timestamps
    end
  end
end
