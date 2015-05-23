class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :date
      t.string :key
      t.timestamps null: false
    end
  end
end
