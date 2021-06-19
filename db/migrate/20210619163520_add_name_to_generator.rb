class AddNameToGenerator < ActiveRecord::Migration[6.1]
  def change
    add_column :generators, :name, :string
  end
end
