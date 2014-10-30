class AddPreferenciasToSolicitudlabs < ActiveRecord::Migration
  def self.up
    add_column :solicitudlabs, :preferencias, :text
  end

  def self.down
    remove_column :solicitudlabs, :preferencias
  end
end
