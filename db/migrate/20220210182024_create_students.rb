class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :notes
      t.string :uin
      t.string :major
      t.float :finalgrade
      t.float :updatedgrade

      t.timestamps
    end
  end
end
