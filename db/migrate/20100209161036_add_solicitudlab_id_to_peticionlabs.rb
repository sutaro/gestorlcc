class AddSolicitudlabIdToPeticionlabs < ActiveRecord::Migration
  def self.up
    add_column :peticionlabs, :solicitudlab_id, :integer 
  end

  def self.down
    remove_column :peticionlabs, :solicitudlab_id
  end
end
