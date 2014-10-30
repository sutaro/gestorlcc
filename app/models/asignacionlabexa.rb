class Asignacionlabexa < ActiveRecord::Base

    belongs_to :solicitudlabexa;
    belongs_to :laboratorio;
end
