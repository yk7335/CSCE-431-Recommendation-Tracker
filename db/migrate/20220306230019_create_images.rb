class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :uin
      t.string :photo

      t.timestamps
    end
  end
end
