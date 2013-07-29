class CreateBirthdays < ActiveRecord::Migration
  def change
    create_table :birthdays do |t|
      t.belongs_to :friend
      t.belongs_to :favorite
      t.string :nickname
      t.string :friend_id
      t.string :favorite_id
      t.datetime :date

      t.timestamps
    end
    add_index :birthdays, :friend_id
    add_index :birthdays, :favorite_id
  end
end
