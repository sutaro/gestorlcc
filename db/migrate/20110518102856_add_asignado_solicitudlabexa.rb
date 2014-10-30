class AddAsignadoSolicitudlabexa < ActiveRecord::Migration
  def self.up
    add_column :solicitudlabexas, :asignado, :boolean
  end

  def self.down
    remove_column :solicitudlabexas, :asignado
  end
end
