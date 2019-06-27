class CreateRaids < ActiveRecord::Migration[5.2]
  def change
    create_table :raids do |t|
      t.string :pokemon_name
      t.string :location
      t.timestamp :date
      t.text :comment

      t.timestamps
    end
  end
end
