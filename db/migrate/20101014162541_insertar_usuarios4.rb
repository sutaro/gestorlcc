# encoding: UTF-8
class InsertarUsuarios4 < ActiveRecord::Migration
  def self.up
    usuario=Usuario.new(:identificador=>"mdr",
                      :password=>"f9824ba4a0c1053d3c448d752236fe4f",
                      :password_confirmation=>"f9824ba4a0c1053d3c448d752236fe4f",
                      :nombre=>"Manuel",
                      :apellidos=>"Díaz Rodríguez",
                      :email=>"mdr@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.13",
                      :telefono=>"1394" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"enriqued",
                      :password=>"3b7bb02bdceae6c4890ea6255add6041" ,
                      :password_confirmation=>"3b7bb02bdceae6c4890ea6255add6041" ,
                      :nombre=>"Enrique",
                      :apellidos=>"Domínguez Merino",
                      :email=>"enriqued@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.7",
                      :telefono=>"7143" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"duran",
                      :password=>"f35644dd55a57b18213cd3bfd9ac87bc",
                      :password_confirmation=>"f35644dd55a57b18213cd3bfd9ac87bc",
                      :nombre=>"Francisco",
                      :apellidos=>"Durán Muñoz",
                      :email=>"duran@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.46",
                      :telefono=>"2820" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"enciso",
                      :password=>"c7f943562439a1fda57801295d2c1e56",
                      :password_confirmation=>"c7f943562439a1fda57801295d2c1e56",
                      :nombre=>"Manuel",
                      :apellidos=>"Enciso García-Oliveros",
                      :email=>"enciso@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.30",
                      :telefono=>"3309" )
    usuario.save!
  end

  def self.down
  end
end
