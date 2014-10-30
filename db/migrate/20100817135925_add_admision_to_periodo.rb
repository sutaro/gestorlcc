class AddAdmisionToPeriodo < ActiveRecord::Migration
  def self.up
    add_column :periodos, :admision, :boolean
  end

  def self.down
    remove_column :periodos, :admision
  end
end
