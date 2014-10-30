class SessionsController < ApplicationController

#require 'net/ldap'

# por defecto, el path de session invita a crear una nueva sesion

  def index
    render :action=> 'new'
  end

  def create
 session[:mensaje]='LDAP desactivado'
###### prueba ldap
# ldap = Net::LDAP.new
# ldap.host = '150.214.108.158'
# ldap.port = 389
# usuario="adminreservas"
# ldap.auth "uid=#{usuario},ou=People,dc=lcc,dc=uma,dc=es","aquimandoyo"
# if ldap.bind
#      session[:mensaje]='Se ha autentificado a :'+'adminreservas'
# else
#      session[:mensaje]='MAL'
# end
    @usuario_actual=Usuario.find_by_identificador_and_password(
                        params[:login],Digest::MD5.hexdigest(params[:password]))

   if @usuario_actual
    #if !@usuario_actual.sesion
     session[:user_id]=@usuario_actual.id
     #@usuario_actual.sesion=true
     #@usuario_actual.save
     if @usuario_actual.admin
     # si el usuario es administrador
      # File.open('/tmp/adminreservas.txt', 'w+') {|f| f.puts(Date.today.to_s) } # da problema de denegacion
       redirect_to new_inicio_path
      else
        if @usuario_actual.identificador=="anonimo"
         redirect_to '/anonimo/new'
        else
 #     # si el usuario es particular
         redirect_to new_userinicio_path
        end
     end
    #else # ya existe una sesion para ese usuario
    # flash[:notice]='El usuario tiene <br> otra sesion abierta'
    # redirect_to new_session_path
    #end
   else
 #    # si el usuario no es conocido
     flash[:notice]='Identificador o <br> password erroneo'
     redirect_to new_session_path
      #render :action => 'new'
 #    #flash[:notice]=""
    end
  end
 # al salir de una session, se borra el id del usuario actual
# y se redirije a la creaciÃ³n de una nueva sesion

  def destroy
    #@usuario_actual.sesion=false
    #@usuario_actual.save
    session[:user_id]=@usuario_actual=nil
    redirect_to new_session_path
  end

end

