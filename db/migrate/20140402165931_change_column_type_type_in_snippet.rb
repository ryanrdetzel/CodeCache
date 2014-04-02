class ChangeColumnTypeTypeInSnippet < ActiveRecord::Migration
  def change
    rename_column :snippets, :type, :language
  end
end
