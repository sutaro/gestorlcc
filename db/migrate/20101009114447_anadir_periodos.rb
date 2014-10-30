# encoding: UTF-8
class AnadirPeriodos < ActiveRecord::Migration
  def self.up
    perio=Periodo.new(:nombre=>"1º Cuatrimestre",
                      :inicio=>"2010-09-27",
                      :fin=>"2011-02-04",
                      :iniciosol=>"2010-09-01",
                      :finsol=>"2010-09-20",
                      :tipo=>"Lectivo",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
    perio=Periodo.new(:nombre=>"2º Cuatrimestre",
                      :inicio=>"2011-02-21",
                      :fin=>"2011-06-10",
                      :iniciosol=>"2010-02-01",
                      :finsol=>"2010-02-15",
                      :tipo=>"Lectivo",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
    perio=Periodo.new(:nombre=>"Exámenes Conv. Diciembre",
                      :inicio=>"2010-12-16",
                      :fin=>"2010-12-22",
                      :iniciosol=>"2010-11-23",
                      :finsol=>"2010-12-06",
                      :tipo=>"Examenes",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
    perio=Periodo.new(:nombre=>"Exámenes 1º Cuatrimestre",
                      :inicio=>"2011-02-07",
                      :fin=>"2011-02-18",
                      :iniciosol=>"2011-01-15",
                      :finsol=>"2011-01-30",
                      :tipo=>"Examenes",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
    perio=Periodo.new(:nombre=>"Exámenes 2º Cuatrimestre",
                      :inicio=>"2011-06-13",
                      :fin=>"2011-06-29",
                      :iniciosol=>"2011-05-20",
                      :finsol=>"2011-06-06",
                      :tipo=>"Examenes",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
    perio=Periodo.new(:nombre=>"Exámenes de Septiembre",
                      :inicio=>"2011-09-01",
                      :fin=>"2011-09-23",
                      :iniciosol=>"2011-06-15",
                      :finsol=>"2011-06-25",
                      :tipo=>"Examenes",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
    perio=Periodo.new(:nombre=>"Día de la Hispanidad",
                      :inicio=>"2010-10-12",
                      :fin=>"2010-10-12",
                      :iniciosol=>nil,
                      :finsol=>nil,
                      :tipo=>"Festivo",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
    perio=Periodo.new(:nombre=>"Todos los Santos",
                      :inicio=>"2010-11-01",
                      :fin=>"2010-11-01",
                      :iniciosol=>nil,
                      :finsol=>nil,
                      :tipo=>"Festivo",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
    perio=Periodo.new(:nombre=>"Día de la Constitución",
                      :inicio=>"2010-12-06",
                      :fin=>"2010-12-06",
                      :iniciosol=>nil,
                      :finsol=>nil,
                      :tipo=>"Festivo",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
    perio=Periodo.new(:nombre=>"Inmaculada Concepción",
                      :inicio=>"2010-12-08",
                      :fin=>"2010-12-08",
                      :iniciosol=>nil,
                      :finsol=>nil,
                      :tipo=>"Festivo",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
    perio=Periodo.new(:nombre=>"Vacaciones de Navidad",
                      :inicio=>"2010-12-23",
                      :fin=>"2011-01-07",
                      :iniciosol=>nil,
                      :finsol=>nil,
                      :tipo=>"Festivo",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
    perio=Periodo.new(:nombre=>"Santo Tomás de Aquino",
                      :inicio=>"2011-01-28",
                      :fin=>"2011-01-28",
                      :iniciosol=>nil,
                      :finsol=>nil,
                      :tipo=>"Festivo",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
    perio=Periodo.new(:nombre=>"Día de Andalucía",
                      :inicio=>"2011-02-28",
                      :fin=>"2011-02-28",
                      :iniciosol=>nil,
                      :finsol=>nil,
                      :tipo=>"Festivo",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
    perio=Periodo.new(:nombre=>"Patrón de Informática",
                      :inicio=>"2011-03-01",
                      :fin=>"2011-03-01",
                      :iniciosol=>nil,
                      :finsol=>nil,
                      :tipo=>"Festivo",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
    perio=Periodo.new(:nombre=>"Semana Santa",
                      :inicio=>"2011-04-15",
                      :fin=>"2011-04-25",
                      :iniciosol=>nil,
                      :finsol=>nil,
                      :tipo=>"Festivo",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
    perio=Periodo.new(:nombre=>"Día del trabajo",
                      :inicio=>"2011-05-01",
                      :fin=>"2011-05-01",
                      :iniciosol=>nil,
                      :finsol=>nil,
                      :tipo=>"Festivo",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
    perio=Periodo.new(:nombre=>"Ntra. Sra. de la Victoria",
                      :inicio=>"2011-09-08",
                      :fin=>"2011-09-08",
                      :iniciosol=>nil,
                      :finsol=>nil,
                      :tipo=>"Festivo",
                      :activo=>"false",
                      :admision=>"false" )
    perio.save!
  end

  def self.down
  end
end
