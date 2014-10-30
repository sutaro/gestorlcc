class CreateHorasexas < ActiveRecord::Migration
  def self.up
    create_table :horasexas do |t|
      t.integer :num
      t.string :comienzo
      t.string :fin
      t.boolean :en_uso

      t.timestamps
    end
  end

  def self.down
    drop_table :horasexas
  end
end
