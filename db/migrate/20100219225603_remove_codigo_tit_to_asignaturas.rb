class RemoveCodigoTitToAsignaturas < ActiveRecord::Migration
  def self.up
     remove_column :asignaturas, :codigo_tit
  end

  def self.down
     add_column :asignaturas, :codigo_tit, :text
  end
end
