class CreateHistoricoasigexas < ActiveRecord::Migration
  def self.up
    create_table :historicoasigexas do |t|
      t.date     :fecha_archivo
      t.string   :periodo
      t.string   :nombre_usu
      t.string   :apellidos_usu
      t.string   :nombre_asig
      t.string   :nombre_tit
      t.string   :curso
      t.string   :nombre_lab
      t.integer  :puestos
      t.string   :horaini
      t.string   :horafin
      t.date     :dia

      t.timestamps
    end
  end

  def self.down
    drop_table :historicoasigexas
  end
end
