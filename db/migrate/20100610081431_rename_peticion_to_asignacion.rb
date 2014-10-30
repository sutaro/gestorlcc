class RenamePeticionToAsignacion < ActiveRecord::Migration
  def self.up
   rename_column :asignacions, :peticion_id, :peticionlab_id
  end

  def self.down
   rename_column :asignacions, :peticionlab_id, :peticion_id
  end
end
