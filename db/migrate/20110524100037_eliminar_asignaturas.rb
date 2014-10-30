class EliminarAsignaturas < ActiveRecord::Migration
  def self.up
   as=Asignatura.all
   as.each{|a| a.destroy}
  end

  def self.down
  end
end
