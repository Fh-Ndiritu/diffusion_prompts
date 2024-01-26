class RemovePartialFromPrompts < ActiveRecord::Migration[7.1]
  def change
    remove_column :prompts, :partial
    remove_column :prompts, :truncated_cells
  end
end
