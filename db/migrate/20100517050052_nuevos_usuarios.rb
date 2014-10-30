class NuevosUsuarios < ActiveRecord::Migration
  def self.up
Usuario.create(:id=>6, :identificador=>"pilarga", :password=> "15b017264843cc0d00e961c5623d2c58", 
                    :nombre=> "Pilar", :apellidos=> "Gonz\xC3\xA1lez", :email=> "pilarbbdd@yahoo.es", 
                    :admin=> false, :despacho=> "1.2.3", :telefono=> 111111)
     Usuario.create(:id=> 7,:identificador=> "juanfc", :password=> "793741d54b00253006453742ad4ed534", 
                    :nombre=>"Juan Antonio", :apellidos=> "Falgueras Cano ", :email=>"jafc@uma.es ", 
                    :admin=> false, :despacho=> "2.3.13", :telefono=> 222222)
     Usuario.create(:id=> 15, :identificador=> "admin", :password=> "c391a460b995e1adb8a62a99c532f1f9", 
                    :nombre=> "Merche", :apellidos=>"Tosina", :email=> "merche@lcc.uma.es", 
                    :admin=> true, :despacho=> "4.4.4", :telefono=> 444444)

  end

  def self.down
  end
end
