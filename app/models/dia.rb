class Dia < ActiveRecord::Base

  has_many :asignacion;

   DIASEM=['Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sabado']
# restricciones sobre los datos
validates_presence_of :num, :nombre,
                        :message => ': No puede estar en blanco'
end
