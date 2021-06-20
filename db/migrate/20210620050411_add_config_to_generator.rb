class AddConfigToGenerator < ActiveRecord::Migration[6.1]
  def change
    add_column :generators, :config, :text
  end
end
