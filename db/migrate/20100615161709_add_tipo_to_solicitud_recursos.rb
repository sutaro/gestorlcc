class AddTipoToSolicitudRecursos < ActiveRecord::Migration
  def self.up
    add_column :periodos, :tipo, :string
  end

  def self.down
    remove_column :periodos, :tipo
  end
end
