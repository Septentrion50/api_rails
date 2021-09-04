class AddImageUrlColumnToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :image_path, :string
  end
end
