class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :thing

      t.timestamps
    end
  end
end
