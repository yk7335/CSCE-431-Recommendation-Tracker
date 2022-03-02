# frozen_string_literal: true

class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :notes
      t.string :uin
      t.string :major
      t.string :finalgrade
      t.string :updatedgrade
      t.string :classname
      t.string :recletter
      t.string :semester
      t.integer :year
      t.timestamps
    end
  end
end
