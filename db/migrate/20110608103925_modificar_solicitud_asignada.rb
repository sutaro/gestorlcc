class ModificarSolicitudAsignada < ActiveRecord::Migration
  def self.up
    remove_column :solicitudlabs, :asignado
    remove_column :solicitudlabexas, :asignado
    add_column :solicitudlabs, :asignado, :string
    add_column :solicitudlabexas, :asignado, :string
  end

  def self.down
  end
end
