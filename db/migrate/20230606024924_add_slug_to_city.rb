class AddSlugToCity < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :slug, :string
  end
end
