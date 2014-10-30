class RemoveHorainiToSolicitudrecursos < ActiveRecord::Migration
  def self.up
    remove_column :solicitudrecursos, :horaini
    remove_column :solicitudrecursos, :horafin
    remove_column :solicitudrecursos, :diasemana
  end

  def self.down
    add_column :solicitudrecursos, :diasemana, :integer
    add_column :solicitudrecursos, :horafin, :integer
    add_column :solicitudrecursos, :horaini, :integer
  end
end
