class AddEspecialToLaboratorios < ActiveRecord::Migration
  def self.up
    add_column :laboratorios, :especial, :boolean
  end

  def self.down
    remove_column :laboratorios, :especial
  end
end
