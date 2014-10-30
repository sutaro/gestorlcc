class RemoveDiasemanaToSolicitudrecursos < ActiveRecord::Migration
  def self.up
    remove_column :solicitudrecursos, :diasemana
  end

  def self.down
    add_column :solicitudrecursos, :diasemana, :integer
  end
end
