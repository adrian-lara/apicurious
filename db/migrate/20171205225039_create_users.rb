class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :user_name
      t.string :token

      t.timestamps
    end
  end
end
