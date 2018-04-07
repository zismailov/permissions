class CreatePermissionRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :permission_roles do |t|
      t.integer :role_id, index: true
      t.integer :permission_id, index: true

      t.timestamps
    end
  end
end
