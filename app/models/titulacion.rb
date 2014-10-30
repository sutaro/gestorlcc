class Titulacion < ActiveRecord::Base
has_many :asignaturas

# restricciones sobre los datos


  validates_presence_of :codigo, :nombre, :abrevia,
                        :message => ': No puede estar en blanco'
  
end
