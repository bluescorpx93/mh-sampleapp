class AddInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gender, :string
    add_column :users, :dob, :string
    add_column :users, :profilepic, :string
  end
end
