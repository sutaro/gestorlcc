class InsertarUsuario2 < ActiveRecord::Migration
  def self.up
    usuario = Usuario.new(:identificador=>'pepillo',
                             :password=>"7e12951d2d3e7e0bd1f5a5dea207d56b",
                             :password_confirmation=>"7e12951d2d3e7e0bd1f5a5dea207d56b",
                             :nombre=>'pepe',
                             :apellidos=>'pepillo',
                             :email=>'pepe@yahoo.es',
                             :admin=>'false',
                             :despacho=>'1.1.1',
                             :telefono=>111111)

    usuario.save!
  end

  def self.down
  end
end
