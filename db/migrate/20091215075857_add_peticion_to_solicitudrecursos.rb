class AddPeticionToSolicitudrecursos < ActiveRecord::Migration
  def self.up
    add_column :solicitudrecursos, :peticion, :string
  end

  def self.down
    remove_column :solicitudrecursos, :peticion
  end
end
