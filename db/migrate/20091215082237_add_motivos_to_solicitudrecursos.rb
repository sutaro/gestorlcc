class AddMotivosToSolicitudrecursos < ActiveRecord::Migration
  def self.up
    add_column :solicitudrecursos, :motivos, :string
  end

  def self.down
    remove_column :solicitudrecursos, :motivos
  end
end
