class CreateRaids < ActiveRecord::Migration[5.2]
  def change
    create_table :raids do |t|
      t.int :id
      t.varchar :pokemon_name
      t.varchar :location
      t.timestamp :date
      t.text :comment

      t.timestamps
    end
  end
end
