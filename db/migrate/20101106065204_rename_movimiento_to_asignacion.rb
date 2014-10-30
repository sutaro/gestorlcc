class RenameMovimientoToAsignacion < ActiveRecord::Migration
  def self.up
     rename_column :asignacions, :movimientos, :mov_dia
  end

  def self.down
     rename_column :asignacions, :mov_dia, :movimientos
  end
end
