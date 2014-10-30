# encoding: UTF-8
class InsertarUsuarios7 < ActiveRecord::Migration
  def self.up
    usuario=Usuario.new(:identificador=>"isahermoso",
                      :password=>  "23bf3677cc0a7aa5b911878f98b9c117",
                      :password_confirmation=>  "23bf3677cc0a7aa5b911878f98b9c117",
                      :nombre=>"Isabel",
                      :apellidos=>"Hermoso Lorente",
                      :email=>"isahermoso@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"I-310-D",
                      :telefono=>"2798" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"hylander",
                      :password=>  "3ce14fc8b77d2e826dc8ae8a37809f2f",
                      :password_confirmation=>  "3ce14fc8b77d2e826dc8ae8a37809f2f",
                      :nombre=>"Gustavo",
                      :apellidos=>"Hylander Impagliazzo",
                      :email=>"hylander@mail.fujitsu.es",
                      :admin=>"false",
                      :despacho=>"   ",
                      :telefono=>"   " )
    usuario.save!
    usuario=Usuario.new(:identificador=>"jja",
                      :password=>"7c8dc285ae485badc1fbbe5724fd30e2",
                      :password_confirmation=>"7c8dc285ae485badc1fbbe5724fd30e2",
                      :nombre=>"José Manuel",
                      :apellidos=>"Jerez Aragonés",
                      :email=>"jja@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.6",
                      :telefono=>"2895" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"isabeljita",
                      :password=>"0af975bbea94d0f6eb22b84e60965bf5",
                      :password_confirmation=>"0af975bbea94d0f6eb22b84e60965bf5",
                      :nombre=>"Isabel",
                      :apellidos=>"Jimenez Tagarro",
                      :email=>"galvez@ctima.uma.es",
                      :admin=>"false",
                      :despacho=>"3.3.12",
                      :telefono=>"2717" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"jlleivao",
                      :password=>"a23d83ebf9181dad62ab6ceb701391b7",
                      :password_confirmation=>"a23d83ebf9181dad62ab6ceb701391b7",
                      :nombre=>"José Luis",
                      :apellidos=>"Leiva Olivencia",
                      :email=>"jlleivao@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"E.U. Turismo 24",
                      :telefono=>"3255" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"luisll",
                      :password=>"e7c63b0000ea3e8c09764e0c9a0f873f",
                      :password_confirmation=>"e7c63b0000ea3e8c09764e0c9a0f873f",
                      :nombre=>"Luis Manuel",
                      :apellidos=>"Llopis Torres",
                      :email=>"luisll@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.6",
                      :telefono=>"2750" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"jlm",
                      :password=>"24652b8a3406d9c552e90a742dc1a4ad",
                      :password_confirmation=>"24652b8a3406d9c552e90a742dc1a4ad",
                      :nombre=>"Fco. Javier",
                      :apellidos=>"López Muñoz",
                      :email=>"jlm@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.4",
                      :telefono=>"1327" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"lopez",
                      :password=> "c5a1a98649a7874de0def093eb136262",
                      :password_confirmation=> "c5a1a98649a7874de0def093eb136262",
                      :nombre=>"Pablo",
                      :apellidos=>"López Olivas",
                      :email=>"lopez@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.50",
                      :telefono=>"3305" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"ignaciolr",
                      :password=>"cede0c0e073874175d58d8c26580d231",
                      :password_confirmation=>"cede0c0e073874175d58d8c26580d231",
                      :nombre=>"Ignacio",
                      :apellidos=>"López Rubio",
                      :email=>"ignaciolr@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.3.12",
                      :telefono=>"3373" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"ezeqlr",
                      :password=>"7755edaf683d01d272f03d4f5be5b0e3",
                      :password_confirmation=>"7755edaf683d01d272f03d4f5be5b0e3",
                      :nombre=>"Ezequiel",
                      :apellidos=>"López Rubio",
                      :email=>"ezeqlr@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.42",
                      :telefono=>"7155" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"valverde",
                      :password=> "ee5683eff03bf585733adaae15bca09d",
                      :password_confirmation=> "ee5683eff03bf585733adaae15bca09d",
                      :nombre=>"Francisco",
                      :apellidos=>"López Valverde",
                      :email=>"valverde@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.33",
                      :telefono=>"7151" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"gabriel",
                      :password=> "647431b5ca55b04fdf3c2fce31ef1915",
                      :password_confirmation=> "647431b5ca55b04fdf3c2fce31ef1915",
                      :nombre=>"Gabriel Jesús",
                      :apellidos=>"Luque Polo",
                      :email=>"gabriel@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.33",
                      :telefono=>"7154" )
    usuario.save!
  end

  def self.down
  end
end
