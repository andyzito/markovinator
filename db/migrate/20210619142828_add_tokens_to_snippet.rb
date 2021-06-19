class AddTokensToSnippet < ActiveRecord::Migration[6.1]
  def change
    add_column :snippets, :tokens, :text
  end
end
