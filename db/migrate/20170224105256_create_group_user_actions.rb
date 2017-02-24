class CreateGroupUserActions < ActiveRecord::Migration[5.1]
  def change
    create_table :group_user_actions do |t|
      t.references :group_user, foreign_key: true
      t.references :target, foreign_key: {to_table: 'group_users'}
      t.integer :change, null: false

      t.timestamps
    end
  end
end
