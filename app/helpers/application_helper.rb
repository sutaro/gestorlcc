# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def fecha_europea(fecha)
    cadena=fecha.to_s.split('-')
    return cadena[2]+'-'+cadena[1]+'-'+cadena[0]
  end

end
