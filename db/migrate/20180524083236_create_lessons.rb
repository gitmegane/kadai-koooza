class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.integer :major_no
      t.text :content
      t.string :image_url
      t.integer :order
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
