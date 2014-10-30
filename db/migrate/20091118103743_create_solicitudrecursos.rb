class CreateSolicitudrecursos < ActiveRecord::Migration
  def self.up
    create_table :solicitudrecursos do |t|
      t.date :fechaini
      t.date :fechafin
      t.integer :horaini
      t.integer :horafin
      t.integer :diasemana
      t.date :fechasol
      t.text :motivos

      t.timestamps
    end
  end

  def self.down
    drop_table :solicitudrecursos
  end
end
