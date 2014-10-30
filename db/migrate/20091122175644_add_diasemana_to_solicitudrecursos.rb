class AddDiasemanaToSolicitudrecursos < ActiveRecord::Migration
  def self.up
    add_column :solicitudrecursos, :diasemana, :text
  end

  def self.down
    remove_column :solicitudrecursos, :diasemana
  end
end
