class ChangeContentFormatInSnippets < ActiveRecord::Migration
  def change
    change_column :snippets, :content, :text
  end
end
