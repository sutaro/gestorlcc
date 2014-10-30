class CreateLaboratorios < ActiveRecord::Migration
  def self.up
    create_table :laboratorios do |t|
      t.string :nombre_lab
      t.integer :puestos
      t.string :ssoo
      t.string :descr_HW
      t.string :descr_SW
      t.string :comentarios

      t.timestamps
    end
  end

  def self.down
    drop_table :laboratorios
  end
end
