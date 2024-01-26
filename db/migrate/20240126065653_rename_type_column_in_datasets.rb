class RenameTypeColumnInDatasets < ActiveRecord::Migration[7.1]
  def change
    rename_column :datasets, :type,  :data_type
  end
end
