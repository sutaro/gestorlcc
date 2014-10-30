class SolicitudrecursousuariosController < ApplicationController
 # GET /solicitudrecursos
  # GET /solicitudrecursos.xml

  before_filter :login_requerido,:usuario?

  def index
    @solicitudrecursos= Solicitudrecurso.find_all_by_usuario_id(session[:user_id])
    @cuenta=@solicitudrecursos.size

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @solicitudrecursousuarios }
    end
  end

  # GET /solicitudrecursos/new
  # GET /solicitudrecursos/new.xml
 
  def new  # modificacion para transacciones
    @solicitudrecurso = Solicitudrecurso.new  
   
    #identifico los tipos distintos de recurso
    @tipos = Recurso.find(:all).map{ |i| i.descripcion }.uniq
    
    # cargo los dias y horas posibles para los select
    @dias=Dia.find(:all,:conditions=>['en_uso = ?',"t"])
    @horas=Horario.find(:all,:conditions=>['en_uso = ?',"t"])

    #obtengo y formateo la fecha actual
    @dia=@solicitudrecurso.fechareserva=formato_europeo(Date.today)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @solicitudrecurso }
    end
  end

  # GET /solicitudrecursos/1/edit
  def edit
 
# NECESITO UN DRYYYY!!!!!
    @solicitudrecurso = Solicitudrecurso.find(params[:id])
    usuario=Usuario.find(@solicitudrecurso.usuario_id)
    @usuario=usuario.apellidos+", "+usuario.nombre   
    @dia=Date.today.strftime("%d-%m-%Y")   
    @nfechareserva=@solicitudrecurso.fechareserva.strftime("%d-%m-%Y")
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @solicitudrecurso }
    end
    
  end

  # POST /solicitudrecursos
  # POST /solicitudrecursos.xml


  def create
    @solicitudrecurso = Solicitudrecurso.new
    @solicitudrecurso.tipo=params[:tipo]
    @solicitudrecurso.fechasol=Date.today
    @solicitudrecurso.horaini=params[:horai]
    @solicitudrecurso.horafin=params[:horaf]
    @solicitudrecurso.fechareserva=session[:fechares]
    @solicitudrecurso.usuario_id=session[:user_id]
    @solicitudrecurso.motivos=params[:motivos]
    
       
      if @solicitudrecurso.save
        familia=Recurso.find_by_identificador(@solicitudrecurso.tipo).descripcion
        @recs=Recurso.find(:all, :conditions => ['descripcion = ? and disponible = ?',familia,"t"])
        @ids=@recs.map {|r| r.identificador}
        #session[:fechares]=params[:fecha]
        dia=formato_europeo(session[:fechares])
        #alreves=session[:fechares].to_s.split('-')
        #dia=alreves[2]+"-"+alreves[1]+"-"+alreves[0]
        @reservas = Solicitudrecurso.find(:all, :conditions => ['tipo in (?) and fechareserva = ?', @ids,dia])

 
        render :update do |page|
          page.replace_html(:'reservas', :partial=>"/solicitudrecursousuarios/recurso_reservado", :object=>@recs)
        end
      end


  end


  # PUT /solicitudrecursos/1
  # PUT /solicitudrecursos/1.xml
  def update
    @solicitudrecurso = Solicitudrecurso.find(params[:id])
    

    respond_to do |format|

    
      if @solicitudrecurso.update_attributes(:motivos => params[:motivos])
               
        @solicitudrecursos = Solicitudrecurso.find_all_by_usuario_id(@usuario_actual.id)
        format.html { redirect_to :action => "index" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @solicitudrecurso.errors, :status => :unprocessable_entity }
      end
    
    end
  end



  # DELETE /solicitudrecursos/1
  # DELETE /solicitudrecursos/1.xml
  def destroy
   @solicitudrecurso = Solicitudrecurso.find(params[:id])
    @solicitudrecurso.destroy
    
    respond_to do |format|
      @solicitudrecursos= Solicitudrecurso.find_all_by_usuario_id(@usuario_actual.id)
      format.html { render :action => "index" }
      format.xml  { head :ok }
    end
  end

  def borra
    @solicitudrecurso = Solicitudrecurso.find(params[:reserva])
    @solicitudrecurso.destroy
    familia=Recurso.find_by_identificador(@solicitudrecurso.tipo).descripcion
    @recs=Recurso.find(:all, :conditions => ['descripcion = ? and disponible = ?',familia,"t"])
    @ids=@recs.map {|r| r.identificador}
    #session[:fechares]=params[:fecha]
    dia=formato_europeo(session[:fechares])
    #alreves=session[:fechares].to_s.split('-')
    #dia=alreves[2]+"-"+alreves[1]+"-"+alreves[0]
    @reservas = Solicitudrecurso.find(:all, :conditions => ['tipo in (?) and fechareserva = ?', @ids,dia])

    render :update do |page|
      page.replace_html(:'reservas', :partial=>"/solicitudrecursousuarios/recurso_reservado", :object=>@reservas)
    end
  end

  def listar
    cadena=params[:query]
    if cadena=~/\d{2}\-\d{2}\-(\d{4})/
        cadena=cadena.split('-')[2]+'-'+cadena.split('-')[1]+'-'+cadena.split('-')[0]
    else
        if cadena=~/\d{2}\-\d{2}/ || cadena=~/\d{2}\-\d{4}/
           cadena=cadena.split('-')[1]+'-'+cadena.split('-')[0]
        else
           if cadena=~/\d{2}\-/
               cadena='-'+cadena.split('-')[0]
           end
        end
    end

    cadena=(cadena.nil?)? "%" : "%#{cadena}%"
    
    @recs=Recurso.find(:all,:conditions=> ["descripcion || identificador LIKE ?", cadena])
    recs=@recs.map {|r| r.identificador}
    
      
    @solicitudrecursos=Solicitudrecurso.find(:all,:conditions=> ["usuario_id = ? and (fechareserva ||  fechasol || motivos LIKE ?  or  tipo in (?))",session[:user_id],cadena,recs])
    @cuenta=@solicitudrecursos.size
    #respond_to {|format| format.js }
  end


  def buscar
   dia=params[:fecha].to_date
   if dia.wday!=0 and dia>=Date.today # no comprueba si el dia es posterior a hoy o no es domingo
     @recs=Recurso.find(:all, :conditions => ['descripcion = ? and disponible = ?',params[:tipo][:descripcion],"t"])
     @ids=@recs.map {|r| r.identificador}
     session[:fechares]=params[:fecha]
     dia=formato_europeo(params[:fecha])
     #alreves=params[:fecha].to_s.split('-')
     #dia=alreves[2]+"-"+alreves[1]+"-"+alreves[0]
     @reservas = Solicitudrecurso.find(:all, :conditions => ['tipo in (?) and fechareserva = ?',@ids,dia])
   else
     @festivo=1
   end
  end
end

