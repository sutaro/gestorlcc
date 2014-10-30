class CreateSolicitudlabexas < ActiveRecord::Migration
  def self.up
    create_table :solicitudlabexas do |t|
      t.date :fechasol
      t.integer :usuario_id
      t.integer :asignatura_id
      t.date :fecha
      t.text :curso
      t.integer :npuestos
      t.text :comentarios
      t.text :preferencias
      t.text :horaini
      t.text :horafin

      t.timestamps
    end
  end

  def self.down
    drop_table :solicitudlabexas
  end
end
