class RenameUsuarioSolicitudrecurso < ActiveRecord::Migration
  def self.up
    
    add_column :solicitudrecursos, :usuario_id, :integer 
  end

  def self.down
    
    remove_column :solicitudrecursos, :usuario_id
  end
end
