class AnadirDias < ActiveRecord::Migration
  def self.up
      dia = Dia.new(:num=>1,
                    :nombre=>"Lunes",
                    :en_uso=>"true")
      dia.save!
      dia = Dia.new(:num=>2,
                    :nombre=>"Martes",
                    :en_uso=>"true")
      dia.save!
      dia = Dia.new(:num=>3,
                    :nombre=>"Miercoles",
                    :en_uso=>"true")
      dia.save!
      dia = Dia.new(:num=>4,
                    :nombre=>"Jueves",
                    :en_uso=>"true")
      dia.save!
      dia = Dia.new(:num=>5,
                    :nombre=>"Viernes",
                    :en_uso=>"true")
      dia.save!
      dia = Dia.new(:num=>6,
                    :nombre=>"Sabado",
                    :en_uso=>"true")
      dia.save!
      dia = Dia.new(:num=>7,
                    :nombre=>"Domingo",
                    :en_uso=>"false")
      dia.save!
  end

  def self.down
  end
end
