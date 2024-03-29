class PeticionsController < ApplicationController
  # GET /peticions
  # GET /peticions.xml


  before_filter :login_requerido
  before_filter :admin?

  def index
    @peticions = Peticion.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @peticions }
    end
  end

  # GET /peticions/1
  # GET /peticions/1.xml
  #def show
  #  @peticion = Peticion.find(params[:id])

  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.xml  { render :xml => @peticion }
  #  end
  #end

  # GET /peticions/new
  # GET /peticions/new.xml
  def new
 #   esto era la nueva peticion cuando iba directa a la bd
 #   @peticion = Peticion.new
 #   ahora, en un carro: ACCION 3, LA SIGUIENTE MÁS ABAJO
    @peticion=Solicitud.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @peticion }
    end
  end

  # GET /peticions/1/edit
  def edit
    @peticion = Peticion.find(params[:id])
  end

  # POST /peticions
  # POST /peticions.xml
  def create

# TODO ESTA HECHO UNA PORQUERIAAAAAAAAAA
# base de datos
    @peticion = Peticion.new 
    @peticion.solicitudrecurso_id=session[:ident] # params[:solicitudrecurso_id].to_s
    @peticion.diasemana=params[:diasemana]
    @peticion.horaini=params[:horaini]
    @peticion.horafin=params[:horafin]
#carro
  @peticion=Solicitud.new
    #@peticion.solicitudrecurso_id=session[:ident] # params[:solicitudrecurso_id].to_s
    @peticion.diasemana=params[:diasemana]
    @peticion.horaini=params[:horaini]
    @peticion.horafin=params[:horafin]
    session[:tramos_horarios].solicitudes<<@peticion
    @pet=Solicitud.new
    #@peticion.solicitudrecurso_id=session[:ident] # params[:solicitudrecurso_id].to_s
    @pet.diasemana=params[:diasemana]
    @pet.horaini=params[:horaini]
    @pet.horafin=params[:horafin]



# AHORA HAY QUE AÑADIR PETICION AL CARRO Y YA ESTA, RECARGAR LA VISION DE LOS TRAMOS CON AJAX
# PERO EN EL CONTROLLER DE SOLICITUD!!!!!!!! A VER COMO HAGO EL CORTOCIRCUITO RECORDAR EL RETURNS-TO (LIBRO)

    session[:peticiones].solicitudes<<@pet # ACCION 6 AQUI ANADO EL TRAMO AL CARRO, LA SIGUIENTE EN SOLIC. CONTROLLER
  
  respond_to do |format|
      if @peticion.save
        
        @peticions=Peticion.all
        format.html { redirect_to(session[:direccion]) }
        format.xml  { render :xml => @peticion, :status => :created, :location => @peticion }
      else
        
        format.html { render :action => "new" }
        format.xml  { render :xml => @peticion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /peticions/1
  # PUT /peticions/1.xml
  def update
    @peticion = Peticion.find(params[:id])

    respond_to do |format|
      if @peticion.update_attributes(:solicitudrecurso_id => params[:solicitudrecurso_id],
                                     :diasemana => params[:diasemana].to_s,
                                     :horaini => params[:horaini].to_s,    
                                     :horafin => params[:horafin].to_s)

        # flash[:notice] = 'Peticion was successfully updated.'
        @peticions=Peticion.all
        format.html { render :action => "index"  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @peticion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /peticions/1
  # DELETE /peticions/1.xml
  def destroy
    @peticion = Peticion.find(params[:id])
    @peticion.destroy
    #session[:tramos]=session[:tramos].reject {|x| x.id==params[:id].to_i}
    if !session[:tramos].empty? 
            
      respond_to {|format| format.js }
    else
      render :text=> "No hay tramos horarios"
    end
  end


end
