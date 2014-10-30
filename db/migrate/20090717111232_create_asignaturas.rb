class CreateAsignaturas < ActiveRecord::Migration
  def self.up
    create_table :asignaturas do |t|
      t.string :codigo_asig
      t.string :nombre_asig
      t.string :area_depto
      t.string :codigo_tit
      t.string :caracter
      t.float :coeficiente_exp
      t.integer :curso
      t.integer :cuatrimestre

      t.timestamps
    end
  end

  def self.down
    drop_table :asignaturas
  end
end
