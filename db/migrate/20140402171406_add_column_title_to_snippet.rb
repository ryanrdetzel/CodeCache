class AddColumnTitleToSnippet < ActiveRecord::Migration
  def change
    add_column :snippets, :title, :text
  end
end
