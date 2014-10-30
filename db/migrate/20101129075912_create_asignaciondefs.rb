class CreateAsignaciondefs < ActiveRecord::Migration
  def self.up
    create_table :asignaciondefs do |t|
       t.integer  :solicitudlab_id
       t.integer  :peticionlab_id
       t.integer  :laboratorio_id
       t.string   :horaini
       t.string   :horafin
       t.integer  :dia_id
       t.string   :mov_dia
       t.string   :mov_hora

      t.timestamps
    end
  end

  def self.down
    drop_table :asignaciondefs
  end
end
