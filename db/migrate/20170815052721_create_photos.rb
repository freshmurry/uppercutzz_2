class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.references :barbershop, foreign_key: true
      t.string "image_file_name"
      t.string "image_content_type"
      t.integer "image_file_size"
      t.timestamps null: false
    end
  end  
end