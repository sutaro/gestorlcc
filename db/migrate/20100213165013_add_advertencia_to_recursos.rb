class AddAdvertenciaToRecursos < ActiveRecord::Migration
  def self.up
    add_column :recursos, :aviso, :text
  end

  def self.down
    remove_column :recursos, :aviso
  end
end
