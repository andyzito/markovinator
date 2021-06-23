class CreateGeneratorConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :generator_configs do |t|
      t.boolean :track_different_eos
      t.belongs_to :generator

      t.timestamps
    end
  end
end
