class AnadirHoras < ActiveRecord::Migration
  def self.up
      hora = Horario.new(:num=>1,
                         :comienzo=>"8:45",
                         :fin=>"9:45",
                         :en_uso=>"true")
      hora.save!
      hora = Horario.new(:num=>2,
                         :comienzo=>"9:45",
                         :fin=>"10:45",
                         :en_uso=>"true")
      hora.save!
      hora = Horario.new(:num=>3,
                         :comienzo=>"10:45",
                         :fin=>"11:45",
                         :en_uso=>"true")
      hora.save!
      hora = Horario.new(:num=>4,
                         :comienzo=>"11:45",
                         :fin=>"12:45",
                         :en_uso=>"true")
      hora.save!
      hora = Horario.new(:num=>5,
                         :comienzo=>"12:45",
                         :fin=>"13:45",
                         :en_uso=>"true")
      hora.save!
      hora = Horario.new(:num=>6,
                         :comienzo=>"13:45",
                         :fin=>"14:45",
                         :en_uso=>"true")
      hora.save!
      hora = Horario.new(:num=>7,
                         :comienzo=>"15:30",
                         :fin=>"16:30",
                         :en_uso=>"true")
      hora.save!
      hora = Horario.new(:num=>8,
                         :comienzo=>"16:30",
                         :fin=>"17:30",
                         :en_uso=>"true")
      hora.save!
      hora = Horario.new(:num=>9,
                         :comienzo=>"17:30",
                         :fin=>"18:30",
                         :en_uso=>"true")
      hora.save!
      hora = Horario.new(:num=>10,
                         :comienzo=>"18:30",
                         :fin=>"19:30",
                         :en_uso=>"true")
      hora.save!
      hora = Horario.new(:num=>11,
                         :comienzo=>"19:30",
                         :fin=>"20:30",
                         :en_uso=>"true")
      hora.save!
      hora = Horario.new(:num=>12,
                         :comienzo=>"20:30",
                         :fin=>"21:30",
                         :en_uso=>"true")
      hora.save!

  end

  def self.down
  end
end
