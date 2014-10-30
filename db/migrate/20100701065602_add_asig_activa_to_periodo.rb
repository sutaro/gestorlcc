class AddAsigActivaToPeriodo < ActiveRecord::Migration
  def self.up
    add_column :periodos, :activo, :boolean
  end

  def self.down
    remove_column :periodos, :activo
  end
end
