class Asignatura < ActiveRecord::Base

CURSO=["optativa",1,2,3,4,5]
LETRA=["A","B","C","D"]
TIPO=["OP","OB","TR"]
AREA=["LSI","IT","CCIA"]
COEF=[1,2,3,4,5]

belongs_to :titulacion
has_many :solicitudlab

# restricciones del modelo
  validates_uniqueness_of :codigo_asig, 
                          :message => ': Ya se encuentra registrado ese valor'
  validates_presence_of :codigo_asig, :nombre_asig, :abrevia_asig,
                        :message => ': No puede estar en blanco'
  validates_length_of :codigo_asig, 
                      :in => 3..5, 
                      :message => ': Debe tener de 3 a 5 cifras'
  validates_numericality_of :codigo_asig, 
                            :only_integer => true,
                            :message => ': Debe ser un entero'
end
