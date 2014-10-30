class RenameColumnsSolicitudlabs < ActiveRecord::Migration
  def self.up
    rename_column :solicitudlabs, :fecha_ini, :fechaini
    rename_column :solicitudlabs, :fecha_fin, :fechafin
    rename_column :solicitudlabs, :fecha_sol, :fechasol
  end

  def self.down
    rename_column :solicitudlabs, :fechaini, :fecha_ini
    rename_column :solicitudlabs, :fechafin, :fecha_fin
    rename_column :solicitudlabs, :fechasol, :fecha_sol
  end
end
