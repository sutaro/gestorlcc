# encoding: UTF-8
class InsertarLaboratorios < ActiveRecord::Migration
  def self.up
    lab=Laboratorio.new(:nombre_lab=>"3.1.1",
                      :puestos=>35,
                      :ssoo=>"Windows y Linux",
                      :descr_HW=>"Ordenado Gateway, 4GB de RAM, 320GB de Disco Duro, Procesador de doble núcleo Intel Pentium E5500 2.8Ghz",
                      :descr_SW=>"Windows XP SP3 y Fedora Core 13(Gnome y Kde)",
                      :comentarios=>"",
                      :especial=>"false",
                      :aviso=>"" )
    lab.save!
    lab=Laboratorio.new(:nombre_lab=>"3.1.2",
                      :puestos=>24,
                      :ssoo=>"Windows y Linux",
                      :descr_HW=>"Ordenado Gateway, 4GB de RAM, 320GB de Disco Duro, Procesador de doble núcleo Intel Pentium E5500 2.8Ghz",
                      :descr_SW=>"Windows XP SP3 y Fedora Core 13(Gnome y Kde)",
                      :comentarios=>"",
                      :especial=>"false",
                      :aviso=>"" )
    lab.save!
    lab=Laboratorio.new(:nombre_lab=>"3.1.3",
                      :puestos=>24,
                      :ssoo=>"Windows y Linux",
                      :descr_HW=>"por determinar",
                      :descr_SW=>"por determinar",
                      :comentarios=>"Windows XP SP3 y Fedora Core 13(Gnome y Kde)",
                      :especial=>"false",
                      :aviso=>"" )
    lab.save!
    lab=Laboratorio.new(:nombre_lab=>"3.1.4",
                      :puestos=>24,
                      :ssoo=>"Apple",
                      :descr_HW=>"IMac de 20 Core 2 Duo 2,8 Ghz, 1GB de RAM, 250GB de Disco duro",
                      :descr_SW=>"por determinar",
                      :comentarios=>"Windows XP SP3 y Fedora Core 13(Gnome y Kde)",
                      :especial=>"true",
                      :aviso=>"" )
    lab.save!
    lab=Laboratorio.new(:nombre_lab=>"3.1.5",
                      :puestos=>24,
                      :ssoo=>"Windows y Linux",
                      :descr_HW=>"por determinar",
                      :descr_SW=>"Windows XP SP3 y Fedora Core 13(Gnome y Kde)",
                      :comentarios=>"",
                      :especial=>"false",
                      :aviso=>"" )
    lab.save!
    lab=Laboratorio.new(:nombre_lab=>"3.1.7",
                      :puestos=>24,
                      :ssoo=>"Windows y Linux",
                      :descr_HW=>"por determinar",
                      :descr_SW=>"Windows XP SP3 y Fedora Core 13(Gnome y Kde)",
                      :comentarios=>"",
                      :especial=>"false",
                      :aviso=>"" )
    lab.save!
    lab=Laboratorio.new(:nombre_lab=>"3.1.8",
                      :puestos=>24,
                      :ssoo=>"Windows y Linux",
                      :descr_HW=>"Ordenado Gateway, 4GB de RAM, 320GB de Disco Duro, Procesador de doble núcleo Intel Pentium E5500 2.8Ghz",
                      :descr_SW=>"Windows XP SP3 y Fedora Core 13(Gnome y Kde)",
                      :comentarios=>"",
                      :especial=>"false",
                      :aviso=>"" )
    lab.save!
    lab=Laboratorio.new(:nombre_lab=>"3.1.9",
                      :puestos=>35,
                      :ssoo=>"Windows y Linux",
                      :descr_HW=>"Ordenado Gateway, 4GB de RAM, 320GB de Disco Duro, Procesador de doble núcleo Intel Pentium E5500 2.8Ghz",
                      :descr_SW=>"Windows XP SP3 y Fedora Core 13(Gnome y Kde)",
                      :comentarios=>"",
                      :especial=>"false",
                      :aviso=>"" )
    lab.save!
  end

  def self.down
  end
end


