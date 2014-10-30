class CreateTitulacions < ActiveRecord::Migration
  def self.up
    create_table :titulacions do |t|
      t.integer :codigo
      t.string :nombre
      t.string :abrevia

      t.timestamps
    end
  end

  def self.down
    drop_table :titulacions
  end
end
