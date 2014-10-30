class AddTitulacionIdToAsignaturas < ActiveRecord::Migration
  def self.up
    add_column :asignaturas, :titulacion_id, :integer
  end

  def self.down
    add_column :asignaturas, :titulacion_id
  end
end
