class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :account_name
      t.integer :account_subscribers
      t.integer :user_id

      t.timestamps
    end

    add_index :accounts, :user_id
  end
end
