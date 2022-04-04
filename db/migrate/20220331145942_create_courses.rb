class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :classname
      t.string :semester
      t.string :year

      t.timestamps
    end
  end
end
