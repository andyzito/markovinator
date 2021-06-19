class RemoveAllData < ActiveRecord::Migration[6.1]
  def down
    Tags.delete_all
    Snippets.delete_all
    Generators.delete_all
  end
end
