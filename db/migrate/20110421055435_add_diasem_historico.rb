class AddDiasemHistorico < ActiveRecord::Migration
  def self.up
    add_column :historicoasigs, :diasem, :string
  end

  def self.down
    remove_column :historicoasigs, :diasem
  end
end
