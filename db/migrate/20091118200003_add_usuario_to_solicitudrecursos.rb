class AddUsuarioToSolicitudrecursos < ActiveRecord::Migration
  def self.up
    add_column :solicitudrecursos, :usuario, :string
  end

  def self.down
    remove_column :solicitudrecursos, :usuario
  end
end
