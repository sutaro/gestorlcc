class UsuariosController < ApplicationController
  # GET /usuarios
  # GET /usuarios.xml

before_filter :login_requerido, :admin?

  def index
    @usuarios = Usuario.find(:all,:order=>"apellidos")
    @cuenta = @usuarios.size

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usuarios }
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.xml
  #def show
  #  @usuario = Usuario.find(params[:id])

  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.xml  { render :xml => @usuario }
  #  end
  #end

  # GET /usuarios/new
  # GET /usuarios/new.xml
  def new
    @usuario = Usuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @usuario }
    end
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.xml
  def create
    @usuario = Usuario.new(params[:usuario])
    @usuario.password=Digest::MD5.hexdigest(@usuario.password)
    @usuario.password_confirmation=Digest::MD5.hexdigest(@usuario.password_confirmation)
    @usuario.admin=false

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to :action => "index" }
        format.xml  { render :xml => @usuario, :status => :created, :location => @usuario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /usuarios/1
  # PUT /usuarios/1.xml
  def update
    @usuario = Usuario.find(params[:id])
   
    respond_to do |format|
  
      #params[:usuario][:password]=Digest::MD5.hexdigest(params[:usuario][:password])
      #params[:usuario][:password_confirmation]=Digest::MD5.hexdigest(params[:usuario][:password_confirmation])
  
      if @usuario.update_attributes(params[:usuario]) 
     #   flash[:notice] = 'El usuario fue actualizado con &eacute;xito.'
        @usuarios = Usuario.find(:all,:order=>"apellidos")
        format.html { redirect_to :action => "index" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.xml
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to(usuarios_url) }
      format.xml  { head :ok }
    end
  end

  #def cambiar

  #  @usuario = Usuario.find(params[:id])
  #  respond_to do |format|
  #      format.html { render :action => "cambiar" }
  #      format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
  #  end
    
    
  #end

  def cambiar
    @usuario=Usuario.find(params[:id])
    
    respond_to do |format|

     params[:password]=Digest::MD5.hexdigest(params[:password])
     #params[:usuario][:password_confirmation]=Digest::MD5.hexdigest(params[:usuario][:password_confirmation])
      
     if @usuario.update_attribute("password", params[:usuario][:password])
     #   flash[:notice] = 'La password ha sido correctamente actualizada.'
        @usuarios=Usuario.all
        format.html { render :action => "index" }
        format.xml  { head :ok }
      else
        format.html { render :action => "cambiar" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end   
 
  def listar
    cadena=(params[:query].nil?)? "%" : "%#{params[:query]}%"
    @usuarios=Usuario.find(:all,:conditions=> ["nombre||' '||apellidos||' '||identificador||' '||email||' '||despacho||' '||telefono LIKE ?",cadena],:order=>"apellidos")
    @cuenta=@usuarios.size
    #respond_to {|format| format.js }
  end

  
end
