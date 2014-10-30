class CreateAsignacionExa < ActiveRecord::Migration
  def self.up
    create_table :asignacionexas do |t|
      t.integer :solicitudlab_id
      t.integer :peticion_id
      t.integer :laboratorio_id
      t.string  :horaini
      t.string  :horafin
      t.integer :dia_id
      t.string  :mov_dia
      t.string  :mov_hora

      t.timestamps
    end
  end

  def self.down
    drop_table :asignacionexas
  end
end
