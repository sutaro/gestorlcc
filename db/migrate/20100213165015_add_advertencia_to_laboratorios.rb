class AddAdvertenciaToLaboratorios < ActiveRecord::Migration
  def self.up
    add_column :laboratorios, :aviso, :text
  end

  def self.down
    remove_column :laboratorios, :aviso
  end
end
