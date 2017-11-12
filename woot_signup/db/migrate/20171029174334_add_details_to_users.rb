class AddDetailsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :document, :string
    add_column :users, :nationality, :string
    add_column :users, :dob, :date
    add_column :users, :phone_number, :string
    add_column :users, :balance, :integer

    change_column :users, :document, :string, :null => false
    add_index :users, :document, unique: true
  end
end
