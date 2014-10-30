class AddAbreviaAsigToAsignaturas < ActiveRecord::Migration
  def self.up
    add_column :asignaturas, :abrevia_asig, :string
  end

  def self.down
    remove_column :asignaturas, :abrevia_asig
  end
end
