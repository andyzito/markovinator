class CreateTokenMappings < ActiveRecord::Migration[6.1]
  def change
    create_table :token_mappings do |t|
      t.string :match
      t.string :token_type
      t.string :token_variant
      t.string :replace

      t.timestamps
    end
  end
end
