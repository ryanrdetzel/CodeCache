class ChangeContentLimitFormatInSnippets < ActiveRecord::Migration
  def change
    change_column :snippets, :content, :text, :limit => 4294967295
  end
end
