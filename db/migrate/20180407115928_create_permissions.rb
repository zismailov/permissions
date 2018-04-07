class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.string :action
      t.boolean :value

      t.timestamps
    end
    add_index :permissions, :action, unique: true
    add_index :permissions, :value, unique: true
  end
end
