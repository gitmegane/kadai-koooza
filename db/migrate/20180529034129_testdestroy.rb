class Testdestroy < ActiveRecord::Migration[5.0]
  def change
    drop_table :users_courses
  end
end
