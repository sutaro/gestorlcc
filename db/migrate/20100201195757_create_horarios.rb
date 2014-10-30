class CreateHorarios < ActiveRecord::Migration
  def self.up
    create_table :horarios do |t|
      t.integer :num
      t.string :comienzo
      t.string :fin
      t.boolean :en_uso

      t.timestamps
    end
  end

  def self.down
    drop_table :horarios
  end
end
