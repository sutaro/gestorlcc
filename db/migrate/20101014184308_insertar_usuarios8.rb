# encoding: UTF-8
class InsertarUsuarios8 < ActiveRecord::Migration
  def self.up
    usuario=Usuario.new(:identificador=>"lawrence",
                      :password=>   "e02d90ea127f923d273786d055b6208e",
                      :password_confirmation=>   "e02d90ea127f923d273786d055b6208e",
                      :nombre=>"Lawrence",
                      :apellidos=>"Mandow Andaluz",
                      :email=>"lawrence@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.38",
                      :telefono=>"3302" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"amg",
                      :password=>   "0b65af7f2357d3fa0ee8d8972d7e0646",
                      :password_confirmation=>   "0b65af7f2357d3fa0ee8d8972d7e0646",
                      :nombre=>"Antonio",
                      :apellidos=>"Maña Gómez",
                      :email=>"amg@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.16",
                      :telefono=>"7142" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"maraval",
                      :password=>"a010b685720015d2c57b22d5d52e5d41",
                      :password_confirmation=>"a010b685720015d2c57b22d5d52e5d41",
                      :nombre=>"Carlos",
                      :apellidos=>"Maraval Lozano",
                      :email=>"maraval@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.1",
                      :telefono=>"1401" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"jmcruz",
                      :password=>"c7bcedca7c62c07fb1c624254783dfb0",
                      :password_confirmation=>"c7bcedca7c62c07fb1c624254783dfb0",
                      :nombre=>"Jesús",
                      :apellidos=>"Martínez Cruz",
                      :email=>"jmcruz@ctima.uma.es",
                      :admin=>"false",
                      :despacho=>"3.3.29",
                      :telefono=>"3304" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"eduardo",
                      :password=>"6d6354ece40846bf7fca65dfabd5d9d4",
                      :password_confirmation=>"6d6354ece40846bf7fca65dfabd5d9d4",
                      :nombre=>"Eduardo",
                      :apellidos=>"Medina Cano",
                      :email=>"eduardo@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.3.12",
                      :telefono=>"3322" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"pedro",
                      :password=> "c6cc8094c2dc07b700ffcc36d64e2138",
                      :password_confirmation=> "c6cc8094c2dc07b700ffcc36d64e2138",
                      :nombre=>"Pedro",
                      :apellidos=>"Merino Gómez",
                      :email=>"pedro@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.9",
                      :telefono=>"2752" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"eva",
                      :password=>"14bd76e02198410c078ab65227ea0794",
                      :password_confirmation=>"14bd76e02198410c078ab65227ea0794",
                      :nombre=>"Eva",
                      :apellidos=>"Millán Valdeperas",
                      :email=>"eva@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.35",
                      :telefono=>"2814" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"jmmb",
                      :password=>  "dd94a3ab3c74939b438978bf88096d02",
                      :password_confirmation=>  "dd94a3ab3c74939b438978bf88096d02",
                      :nombre=>"Juan Miguel",
                      :apellidos=>"Molina Bravo",
                      :email=>"jmmb@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.47",
                      :telefono=>"2815" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"monte",
                      :password=>"ae442b3ec02781e25f556cee2bb3eec3",
                      :password_confirmation=>"ae442b3ec02781e25f556cee2bb3eec3",
                      :nombre=>"José Antonio",
                      :apellidos=>"Montenegro Montes",
                      :email=>"monte@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.40",
                      :telefono=>"2898" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"llanos",
                      :password=>"eef4857ee1bab4447642c43030e3c369",
                      :password_confirmation=>"eef4857ee1bab4447642c43030e3c369",
                      :nombre=>"Llanos",
                      :apellidos=>"Mora López",
                      :email=>"llanos@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.26",
                      :telefono=>"2802" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"morales",
                      :password=>  "5e0c550ebc5db9f1c5ebae8e30ef722e",
                      :password_confirmation=>  "5e0c550ebc5db9f1c5ebae8e30ef722e",
                      :nombre=>"Rafael",
                      :apellidos=>"Morales Bueno",
                      :email=>"morales@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.22",
                      :telefono=>"1395" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"vergara",
                      :password=> "7377d456fe8a89031b6a2212e523863b",
                      :password_confirmation=> "7377d456fe8a89031b6a2212e523863b",
                      :nombre=>"Nathalie",
                      :apellidos=>"Moreno Vergara",
                      :email=>"vergara@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.34",
                      :telefono=>"3393" )
    usuario.save!
    usuario=Usuario.new(:identificador=>"munozp",
                      :password=> "dee3d8ae4f43b3978989999fdf27a0d3",
                      :password_confirmation=> "dee3d8ae4f43b3978989999fdf27a0d3",
                      :nombre=>"José",
                      :apellidos=>"Muñoz Pérez",
                      :email=>"munozp@lcc.uma.es",
                      :admin=>"false",
                      :despacho=>"3.2.19",
                      :telefono=>"2726" )
    usuario.save!
  end

  def self.down
  end
end
