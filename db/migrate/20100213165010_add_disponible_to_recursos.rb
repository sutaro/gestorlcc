class AddDisponibleToRecursos < ActiveRecord::Migration
  def self.up
    add_column :recursos, :disponible, :boolean
  end

  def self.down
    remove_column :recursos, :disponible
  end
end
