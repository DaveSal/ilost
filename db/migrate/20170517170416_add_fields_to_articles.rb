class AddFieldsToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :contact, :string
  end
end
