class AddTipoToSolicitudlab < ActiveRecord::Migration
  def self.up
     add_column :solicitudlabs, :tipo, :string
  end

  def self.down
     remove_column :solicitudlabs, :tipo, :string
  end
end
