class CreateSectionImages < ActiveRecord::Migration
  def self.up
    create_table :section_images do |t|
      t.integer :edicion_id
      t.integer :seccion_id
      t.string :banner_file_name
      t.string :banner_content_type
      t.datetime :banner_updated_at
      t.integer :banner_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :section_images
  end
end
