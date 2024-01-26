class CreateDatasets < ActiveRecord::Migration[7.1]
  def change
    create_table :datasets do |t|
      t.string :name
      t.string :type
      t.string :language
      t.string :source

      t.timestamps
    end
  end
end
