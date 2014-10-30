class CreatePeticions < ActiveRecord::Migration
  def self.up
    create_table :peticions do |t|
      t.integer :solicitudrecurso_id
      t.string :diasemana
      t.string :horaini
      t.string :horafin

      t.timestamps
    end
  end

  def self.down
    drop_table :peticions
  end
end
