class CreateJoinTableTaggings < ActiveRecord::Migration[6.1]
  def change
    create_join_table :snippets, :tags do |t|
      # t.index [:snippet_id, :tag_id]
      # t.index [:tag_id, :snippet_id]
    end
  end
end
