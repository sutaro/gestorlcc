class Asignaciondef < ActiveRecord::Base

    belongs_to :peticionlab;
    belongs_to :solicitudlab;
    belongs_to :laboratorio;
    belongs_to :dia;

end
