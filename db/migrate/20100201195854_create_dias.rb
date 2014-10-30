class CreateDias < ActiveRecord::Migration
  def self.up
    create_table :dias do |t|
      t.integer :num
      t.string :nombre
      t.boolean :en_uso

      t.timestamps
    end
  end

  def self.down
    drop_table :dias
  end
end
