class AddDespachoTelefToUsuarios < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :despacho, :string
    add_column :usuarios, :telefono, :int
  end

  def self.down
    remove_column :usuarios, :telefono
    remove_column :usuarios, :despacho
  end
end
