class CreateAsignacions < ActiveRecord::Migration
  def self.up
    create_table :asignacions do |t|
      t.integer :solicitudlab_id
      t.integer :peticion_id
      t.integer :laboratorio_id

      t.timestamps
    end
  end

  def self.down
    drop_table :asignacions
  end
end
