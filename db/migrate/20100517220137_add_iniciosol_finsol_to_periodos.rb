class AddIniciosolFinsolToPeriodos < ActiveRecord::Migration
  def self.up
    add_column :periodos, :iniciosol, :date
    add_column :periodos, :finsol, :date
  end

  def self.down
    remove_column :periodos, :iniciosol
    remove_column :periodos, :finsol
  end
end
