class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.string :lastname
      t.string :firstname
      t.string :uin
      t.string :email
      t.string :classname
      t.string :notes
      t.string :major
      t.string :finalgrade
      t.string :updatedgrade
      t.string :recletter
      t.string :semester
      t.string :year

      t.timestamps
    end
  end
end
