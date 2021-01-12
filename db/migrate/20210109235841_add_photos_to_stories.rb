class AddPhotosToStories < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :photos, :string
  end
end
