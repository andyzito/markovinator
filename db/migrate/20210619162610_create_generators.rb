class CreateGenerators < ActiveRecord::Migration[6.1]
  def change
    create_table :generators do |t|
      t.text :model

      t.timestamps
    end
  end
end
