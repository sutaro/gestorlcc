class AddHorafinToAsignacion < ActiveRecord::Migration
  def self.up
    add_column :asignacions, :horafin, :string
  end

  def self.down
    remove_column :asignacions, :horafin
  end
end
