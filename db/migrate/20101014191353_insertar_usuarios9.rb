# encoding: UTF-8
class InsertarUsuarios9 < ActiveRecord::Migration
  def self.up
    usuario=Usuario.new(:identificador=>"enavarro",
                      :password=>  "0632b1f933fcd5756738ad6b2b944e07",
                      :password_confirmation=>  "0632b1f933fcd5756738ad6b2b944e07",
                      :nombre=>"Emilio Jose",
                      :apellidos=>"Navarro Peris",
                      :email=>"enavarro@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"I-323-D",
                      :telefono=>"2096" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"antonio",
                      :password=>  "4a181673429f0b6abbfd452f0f3b5950",
                      :password_confirmation=> "4a181673429f0b6abbfd452f0f3b5950",
                      :nombre=>"Antonio J.",
                      :apellidos=>"Nebro Urbaneja",
                      :email=>"antonio@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.15",
                      :telefono=>"3310" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"mnunez",
                      :password=> "37428d7c54a6eccbf324c7de8716842e",
                      :password_confirmation=> "37428d7c54a6eccbf324c7de8716842e",
                      :nombre=>"Marlon",
                      :apellidos=>"Núñez Paz",
                      :email=>"mnunez@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.27",
                      :telefono=>"3313" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"onieva",
                      :password=>"af748175ce822f603058c291f925c008",
                      :password_confirmation=>"af748175ce822f603058c291f925c008",
                      :nombre=>"José Antonio",
                      :apellidos=>"Onieva Gonzalez",
                      :email=>"onieva@ctima.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.40",
                      :telefono=>"2898" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"juanjose",
                      :password=> "f429e34492f74ff5f40d2fffc6efecdf",
                      :password_confirmation=> "f429e34492f74ff5f40d2fffc6efecdf",
                      :nombre=>"Juan José",
                      :apellidos=>"Ortega Daza",
                      :email=>"juanjose@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"b.3.8",
                      :telefono=>"4313" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"jmortiz",
                      :password=> "85b24b36933be00b3f8065dca0c21429",
                      :password_confirmation=>"85b24b36933be00b3f8065dca0c21429",
                      :nombre=>"Juan Miguel",
                      :apellidos=>"Ortiz  Lazcano Lobato",
                      :email=>"jmortiz@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.21",
                      :telefono=>"2805" )
    usuario.save!
  end

  def self.down
  end
end
