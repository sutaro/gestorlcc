class Horario < ActiveRecord::Base

# restricciones sobre los datos
validates_presence_of :num, :comienzo, :fin,
                        :message => ': No puede estar en blanco'
validates_format_of :comienzo, :fin,
                     :with => %r{[1-9]?[0-9]\:[0-9][0-9]},
                     :message => ': El formato debe ser hh:mm'
end
