class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :content
      t.string :type

      t.timestamps
    end
  end
end
