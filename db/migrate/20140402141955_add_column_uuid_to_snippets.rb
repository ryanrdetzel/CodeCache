class AddColumnUuidToSnippets < ActiveRecord::Migration
  def change
    add_column :snippets, :uuid, :text
  end
end
