class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :api_key

    
      t.string :start_year

      t.timestamps null: false
    end
  end
end
