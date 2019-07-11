class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.integer :number
      t.integer :form_id, default: 0
      t.string :name
      t.integer :level

      t.timestamps
    end
  end
end
