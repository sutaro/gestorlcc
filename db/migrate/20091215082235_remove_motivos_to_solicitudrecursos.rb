class RemoveMotivosToSolicitudrecursos < ActiveRecord::Migration
  def self.up
    remove_column :solicitudrecursos, :motivos
  end

  def self.down
    add_column :solicitudrecursos, :motivos, :text
  end
end
