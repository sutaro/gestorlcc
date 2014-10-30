class CreateAsignacionlabexas < ActiveRecord::Migration
  def self.up
    create_table :asignacionlabexas do |t|
      t.integer :solicitudlabexa_id
      t.integer :laboratorio_id
      t.date    :dia
      t.string  :horaini
      t.string  :horafin
      t.string  :mov_dia
      t.string  :mov_hora


      t.timestamps
    end
  end

  def self.down
    drop_table :asignacionlabexas
  end
end
