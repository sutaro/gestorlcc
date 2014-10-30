class Solicitudhoraria
  attr_accessor :solicitudes

  def initialize
    @solicitudes=[]
  end

  def anadir_solicitud(solicitud)
    @solicitudes.each {|s| if s.diasemana == solicitud.diasemana and
                              s.horaini == solicitud.horaini and
                              s.horafin == solicitud.horafin
                           flash[:notice]="Ese tramo ya ha sido elegido con anterioridad"  # esto no va, da error
                           return
                           end}
     @solicitudes << solicitud
  end

  def borrar_solicitud(num)
     @solicitudes=@solicitudes.reject {|x| x.id.to_i==num.to_i}
  end   
end
