class CreateGroupUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :group_users do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.boolean :owner, default: false, null: false
      t.integer :balance, default: 0, null: false

      t.timestamps
    end
  end
end
