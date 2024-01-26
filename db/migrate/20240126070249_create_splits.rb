class CreateSplits < ActiveRecord::Migration[7.1]
  def change
    create_table :splits do |t|
      t.string :name
      t.references :dataset, null: false, foreign_key: true

      t.timestamps
    end
  end
end
