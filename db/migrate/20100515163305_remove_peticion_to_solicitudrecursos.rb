class RemovePeticionToSolicitudrecursos < ActiveRecord::Migration
  def self.up
    remove_column :solicitudrecursos, :peticion
    add_column :solicitudrecursos, :horaini, :string
    add_column :solicitudrecursos, :horafin, :string
  end

  def self.down
    add_column :solicitudrecursos, :peticion, :string
    remove_column :solicitudrecursos, :horaini
    remove_column :solicitudrecursos, :horafin
  end
end
