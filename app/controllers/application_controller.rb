# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base


  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  

  before_filter :comprobar_usuario_login

  protected

    def comprobar_usuario_login
       return unless session[:user_id]
       @usuario_actual = Usuario.find_by_id(session[:user_id])
    end

    def login_usuario?
       !@usuario_actual.nil?
    end
    helper_method :login_usuario?

    def login_requerido
      return true if login_usuario?
      session[:vuelta_a]=request.request_uri
      redirect_to new_session_path and return false
    end

#chequeo de si un usuario es administrador
#en aquellas zonas en que solo puede entrar el admin
#se incluye este filtro

    def admin?
      @usuario_actual = Usuario.find_by_id(session[:user_id])
      return true if @usuario_actual.admin?
      redirect_to new_session_path and return false
    end
    helper_method :admin?

    def usuario?
      @usuario_actual = Usuario.find_by_id(session[:user_id])
      return true if !@usuario_actual.admin? and @usuario_actual.identificador!="anonimo"
      redirect_to new_session_path and return false
    end
    helper_method :usuario?

    def formato_europeo(fecha)
      nfecha=fecha.to_s.split('-')
      nfechaini=nfecha[2]+"-"+nfecha[1]+"-"+nfecha[0]
      return nfechaini
    end

    helper_method :formato_europeo

    def horas(solicitud)
      tramos=Peticionlab.find_all_by_solicitudlab_id(solicitud.id)
      total=0
      tramos.each {|t| p=Horario.find_by_comienzo(t.horaini).id.to_i
                       f=Horario.find_by_fin(t.horafin).id.to_i
                       total+=(f-p+1)
                  }
      return total
    end

    def horasexa(solicitud)
       p=Horasexa.find_by_comienzo(solicitud.horaini).id.to_i
       f=Horasexa.find_by_fin(solicitud.horafin).id.to_i
       total=(f-p+1)
       return total
    end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
