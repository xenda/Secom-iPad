class AddBannerToArticles < ActiveRecord::Migration
  def self.up
    add_column :articulos, :banner_file_name, :string
    add_column :articulos, :banner_file_size, :integer
    add_column :articulos, :banner_updated_at, :datetime
    add_column :articulos, :banner_content_type, :string
  end

  def self.down
    remove_column :articulos, :banner_content_type
    remove_column :articulos, :banner_updated_at
    remove_column :articulos, :banner_file_size
    remove_column :articulos, :banner_file_name
  end
end
