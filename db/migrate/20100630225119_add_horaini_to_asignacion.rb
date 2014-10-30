class AddHorainiToAsignacion < ActiveRecord::Migration
  def self.up
    add_column :asignacions, :horaini, :string
  end

  def self.down
    remove_column :asignacions, :horaini
  end
end
