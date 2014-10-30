class RenamePeticionEnAsignacionexa < ActiveRecord::Migration
  def self.up
     rename_column :asignacionexas, :peticion_id, :peticionlab_id
  end

  def self.down
     rename_column :asignacionexas, :peticion_lab_id, :peticion_id
  end
end
