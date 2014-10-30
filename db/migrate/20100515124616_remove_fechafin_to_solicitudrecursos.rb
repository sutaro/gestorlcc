class RemoveFechafinToSolicitudrecursos < ActiveRecord::Migration
  def self.up
     remove_column :solicitudrecursos, :fechafin
     rename_column :solicitudrecursos, :fechaini, :fechareserva
  end

  def self.down
     add_column :solicitudrecursos, :fechafin, :date
     rename_column :solicitudrecursos, :fechareserva, :fechaini
  end
end
