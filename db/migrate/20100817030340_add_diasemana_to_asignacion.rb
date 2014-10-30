class AddDiasemanaToAsignacion < ActiveRecord::Migration
  def self.up
    add_column :asignacions, :dia_id,  :int
  end

  def self.down
    remove_column :asignacions, :dia_id
  end
end
