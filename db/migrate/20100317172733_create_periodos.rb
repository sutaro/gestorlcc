class CreatePeriodos < ActiveRecord::Migration
  def self.up
    create_table :periodos do |t|
      t.string :nombre
      t.date :inicio
      t.date :fin

      t.timestamps
    end
  end

  def self.down
    drop_table :periodos
  end
end
