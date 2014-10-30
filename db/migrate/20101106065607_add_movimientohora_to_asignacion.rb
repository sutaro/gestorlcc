class AddMovimientohoraToAsignacion < ActiveRecord::Migration
  def self.up
    add_column :asignacions, :mov_hora, :string
  end

  def self.down
    remove_column :asignacions, :mov_hora 
  end
end
