class SolicitarController < ApplicationController

before_filter :login_requerido

  def anadir
    @peticion=Solicitud.new
    session[:codigo_tramo]-=1
    @peticion.id=session[:codigo_tramo]
    @peticion.diasemana=params[:diasemana][:nombre].to_s
    if Horario.find_by_fin(params[:horafin][:fin].to_s).id>=Horario.find_by_comienzo(params[:horaini][:comienzo].to_s).id
       @peticion.horaini=params[:horaini][:comienzo].to_s
       @peticion.horafin=params[:horafin][:fin].to_s
       session[:tramos_horarios].anadir_solicitud(@peticion)
       @actual=@peticion.id
       respond_to {|format| format.js }
    else
       render :update do |page| 
            page.replace_html(:'errores', 
                  '<div id="errorExplanation" style="top:400px">
                  <p>Imposible incluir tramo horario:</p>
                  <ul><li>Hora de fin anterior a la de inicio</li></ul>
                </div>')
       end
    end
    
  
    
  end


  def eliminar
    session[:tramos_horarios].borrar_solicitud(params[:num])
    @actual=(params[:num])
    if session[:borrar].nil?
      session[:borrar]=params[:num]
    else
      session[:borrar]<<params[:num]
    end
    respond_to {|format| format.js }
  end

end
