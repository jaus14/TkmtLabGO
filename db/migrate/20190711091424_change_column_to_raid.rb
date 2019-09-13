class ChangeColumnToRaid < ActiveRecord::Migration[5.2]
  def change

    add_column :raids, :pokemon_id, :integer
    add_column :raids, :place_id, :integer

    remove_column :raids, :pokemon_name, :string
    remove_column :raids, :location, :integer
  end
end
