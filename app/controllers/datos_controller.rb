class DatosController < ApplicationController

  before_filter :login_requerido
  before_filter :usuario?


  #def show
  #  @usuario = @usuario_actual

  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.xml  { render :xml => @usuario }
  #  end
  #end

  def edit
   # flash[:notice] = 'voy a editar'
    @usuario = @usuario_actual
  end

  def update
    @usuario=@usuario_actual
    @antiguapass=@usuario.password

    respond_to do |format|
      if !params[:usuario][:password].nil? or !params[:usuario][:password_confirmation].nil?
           params[:usuario][:password]=Digest::MD5.hexdigest(params[:usuario][:password])
           params[:usuario][:password_confirmation]=Digest::MD5.hexdigest(params[:usuario][:password_confirmation])
      else
           params[:usuario][:password]=@antiguapass
           params[:usuario][:password_confirmation]=@antiguapass
      end 

      if @usuario.update_attributes(params[:usuario])
      #  flash[:notice] = 'Asignatura fue actualizada con &eacute;xito.'
        format.html { redirect_to new_userinicio_path }
        format.xml  { head :ok }
      else
        format.html { render :controller => "dato",:action => "edit" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

end
