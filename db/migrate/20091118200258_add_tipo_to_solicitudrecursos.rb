class AddTipoToSolicitudrecursos < ActiveRecord::Migration
  def self.up
    add_column :solicitudrecursos, :tipo, :string
  end

  def self.down
    remove_column :solicitudrecursos, :tipo
  end
end
