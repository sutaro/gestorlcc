class AddTipoToSolicitudlabexa < ActiveRecord::Migration
  def self.up
    add_column :solicitudlabexas, :tipo, :string
  end

  def self.down
    remove_column :solicitudlabexas, :tipo
  end
end
