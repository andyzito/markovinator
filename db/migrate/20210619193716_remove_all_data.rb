class RemoveAllData < ActiveRecord::Migration[6.1]
  def down
    Tag.delete_all
    Snippet.delete_all
    Generator.delete_all
  end
end
