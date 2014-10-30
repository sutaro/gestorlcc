class AddAsignadoSolicitudlab < ActiveRecord::Migration
  def self.up
    add_column :solicitudlabs, :asignado, :boolean
  end

  def self.down
    remove_column :solicitudlabs, :asignado
  end
end
