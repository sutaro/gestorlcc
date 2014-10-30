class SolicitudlabexasController < ApplicationController
  # GET /solicitudlabexas
  # GET /solicitudlabexas.xml

  before_filter :login_requerido, :admin?

  def index
    @solicitudlabexas = Solicitudlabexa.find(:all,:order=>"fecha")
    @cuenta = @solicitudlabexas.size
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @solicitudlabexas }
    end
  end

  # GET /solicitudlabexas/new
  # GET /solicitudlabexas/new.xml
  def new
    @solicitudlabexa = Solicitudlabexa.new

    session[:titulacion]=Titulacion.find(:first)
    session[:nivel]=Asignatura::CURSO.first

    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @solicitudlabexa }
    end
  end

  # GET /solicitudlabs/1/edit
  def edit
    @solicitudlabexa = Solicitudlabexa.find(params[:id])
    
    @solicitudlabexa.fecha=formato_europeo(@solicitudlabexa.fecha)
 
  end

  # POST /solicitudlabs
  # POST /solicitudlabs.xml
  def create
    @solicitudlabexa = Solicitudlabexa.new(params[:solicitudlabexa])
    @solicitudlabexa.usuario_id = params[:usuario][:identificador].to_i
    @solicitudlabexa.asignatura_id = params[:asignatura][:id].to_i unless params[:asignatura].nil?
    @solicitudlabexa.fechasol=Date.today
    @solicitudlabexa.npuestos=params[:npuestos].to_s
    @solicitudlabexa.curso=params[:nivel].to_s
    @solicitudlabexa.comentarios=Iconv.conv('ascii//translit//ignore', 'utf-8', params[:comentarios])

    @solicitudlabexa.horaini=params[:horaini][:comienzo]
    @solicitudlabexa.horafin=params[:horafin][:fin]
    @solicitudlabexa.asignado="N"
    
    if params[:fecha]=~ /[0-3]?[0-9]\-[0-1]?[0-9]\-[0-9]{4}/
      nfecha=formato_europeo(params[:fecha])
      @solicitudlabexa.fecha=nfecha.to_date
    else
      @solicitudlabexa.fecha=nil
    end

    pref=""
    @especiales=Laboratorio.find(:all,:conditions=>['especial=?',"t"]) 
    for especial in @especiales do
      nombre=especial.ssoo.to_s
      if params[:"#{nombre}"].to_s!='in'
        pref+=especial.nombre_lab.to_s+'-'+nombre+'-'+params[:"#{nombre}"]+";"
      end
    end
    @solicitudlabexa.preferencias=pref
    @solicitudlabexa.tipo="P"
    
    respond_to do |format|

      if @solicitudlabexa.save      
       CorreoTecnicos::deliver_emitesolicitudexamen(@solicitudlabexa,params[:fecha],"Solicitud cursada por admin","Nueva ")       
              
        @solicitudlabexas = Solicitudlabexa.all
        
        format.html { redirect_to :action => "index" }
        format.xml  { render :xml => @solicitudlabexas, :status => :created, :location => @solicitudlabexas }
      else
        format.html { redirect_to :action => "new" }
        format.xml  { render :xml => @solicitudlabexas.errors, :status => :unprocessable_entity }
      end
     
    end
    
  end

  # PUT /solicitudlabexas/1
  # PUT /solicitudlabexas/1.xml

 def update
    @solicitudlabexa = Solicitudlabexa.find(params[:id])

    respond_to do |format|



    if params[:fecha]=~ /[0-3]?[0-9]\-[0-1]?[0-9]\-[0-9]{4}/
      nfecha=formato_europeo(params[:fecha])
    else
      nfecha=@solicitudlabexa.fecha
    end

    pref=""
    @especiales=Laboratorio.find(:all,:conditions=>['especial=?',"t"]) 
    for especial in @especiales do
      nombre=especial.ssoo.to_s
      if params[:"#{nombre}"].to_s!='in'
        pref+=especial.nombre_lab.to_s+'-'+nombre+'-'+params[:"#{nombre}"]+";"
      end
    end
    @solicitudlabexa.preferencias=pref

    nombrecomp = params[:usuario][:identificador].to_s.split(', ')
      if @solicitudlabexa.update_attributes(:fecha => nfecha,                                             
                                             :usuario_id => params[:usuario][:identificador].to_i,
                                             :asignatura_id => params[:asignatura][:id].to_i,
                                             :fechasol => Date.today,
                                             :horaini => params[:horaini][:comienzo],
                                             :horafin => params[:horafin][:fin],
					     :curso => params[:nivel].to_s,
					     :npuestos => params[:npuestos].to_s,
                                             :comentarios=>Iconv.conv('ascii//translit//ignore', 'utf-8', params[:comentarios]))

CorreoTecnicos::deliver_emitesolicitudexamen(@solicitudlabexa,params[:fecha],"Solicitud cursada por admin","Cambios en ")      
        @solicitudlabexas = Solicitudlabexa.all
        format.html { redirect_to :action => "index" }
        format.xml  { head :ok }
      else
        format.html { redirect_to :action => "edit"}
        format.xml  { render :xml => @solicitudlabexa.errors, :status => :unprocessable_entity }
      end
   
    end
  end

  

  # DELETE /solicitudlabexas/1
  # DELETE /solicitudlabexas/1.xml
 def destroy
    @solicitudlabexa = Solicitudlabexa.find(params[:id])
    @solicitudlabexa.destroy
    CorreoTecnicos::deliver_emitesolicitudexamen(@solicitudlabexa,params[:fecha],"Solicitud cursada por admin","Borrado de ")      
    respond_to do |format|
      format.html { redirect_to(solicitudlabexas_url) }
      format.xml  { head :ok }
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
    
    @usuarios=Usuario.find(:all,:conditions=> ["nombre || apellidos LIKE ?",cadena])
    codigos_u=@usuarios.map { |t| t.id}
    @asignaturas=Asignatura.find(:all,:conditions=> ["nombre_asig || abrevia_asig || curso LIKE ?",cadena])
    codigos_a=@asignaturas.map { |t| t.id}
    @labs_especiales=Laboratorio.find(:all,:conditions=> ["ssoo || nombre_lab like ? and especial=?",cadena,"t"])
    nombre_l=@labs_especiales.map {|l| l.nombre_lab+'-'+l.ssoo+'-'+'si'+';'}
    nombre_l=nombre_l+@labs_especiales.map {|l| l.nombre_lab+'-'+l.ssoo+'-'+'no'+';'}
    @solicitudlabexas=Solicitudlabexa.find(:all,:conditions=> ["npuestos || curso || fecha || fechasol LIKE ? or usuario_id in (?) or asignatura_id in (?) or preferencias in (?)", cadena, codigos_u, codigos_a, nombre_l])
    @cuenta=@solicitudlabexas.size
    #respond_to {|format| format.js }
  end

 
end
