class CreatePermissionUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :permission_users do |t|
      t.integer :user_id, index: true
      t.integer :permission_id, index: true

      t.timestamps
    end
  end
end
