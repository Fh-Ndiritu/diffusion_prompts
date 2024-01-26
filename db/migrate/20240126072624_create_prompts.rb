class CreatePrompts < ActiveRecord::Migration[7.1]
  def change
    create_table :prompts do |t|
      t.references :split, null: false, foreign_key: true
      t.integer :row_idx
      t.text :content
      t.string :truncated_cells
      t.boolean :partial, default: false

      t.timestamps
    end
  end
end
