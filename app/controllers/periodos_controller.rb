class PeriodosController < ApplicationController
  # GET /periodos
  # GET /periodos.xml


  before_filter :login_requerido
  before_filter :admin?
 

  @@tipo=''

  def index
    @periodos = Periodo.find(:all,:order=>"inicio") 
    session[:cambia_activo]=cambia_admision=false

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @periodos }
    end
  end

  # GET /periodos/new
  # GET /periodos/new.xml
  def new
    @periodo = Periodo.new
    @dia=formato_europeo(Date.today)
    #hoy=Date.today.to_s.split('-') 
    #@dia=hoy[2]+'-'+hoy[1]+'-'+hoy[0]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @periodo }
    end
  end

  # GET /periodos/1/edit
  def edit
    @periodo = Periodo.find(params[:id])
    @tipoact=@periodo.tipo
    @activo="NO" unless @periodo.activo?
    @admision="NO" unless @periodo.admision?
  end

  # POST /periodos
  # POST /periodos.xml
  def create
    @periodo = Periodo.new(params[:periodo])
    @periodo.tipo=params[:tipo]
 #   @periodo.activo=params[:activo]=="SI"
 
    if params[:inicio]=~ /[0-3]?[0-9]\-[0-1]?[0-9]\-[0-9]{4}/
      ninicio=formato_europeo(params[:inicio])
      #fecha=params[:inicio].to_s.split('-')
      #ninicio=fecha[2]+"-"+fecha[1]+"-"+fecha[0]
      @periodo.inicio=ninicio.to_date
    else
      @periodo.inicio=nil
    end
    
    if params[:fin]=~ /[0-3]?[0-9]\-[0-1]?[0-9]\-[0-9]{4}/
      nfin=formato_europeo(params[:fin])
      #fecha=params[:fin].to_s.split('-')
      #nfin=fecha[2]+"-"+fecha[1]+"-"+fecha[0]
      @periodo.fin=nfin.to_date
    else
      @periodo.fin=nil
    end

    if params[:iniciosol]=~ /[0-3]?[0-9]\-[0-1]?[0-9]\-[0-9]{4}/
      ninicio=formato_europeo(params[:iniciosol])
      #fecha=params[:iniciosol].to_s.split('-')
      #ninicio=fecha[2]+"-"+fecha[1]+"-"+fecha[0]
      @periodo.iniciosol=ninicio.to_date
    else
      @periodo.iniciosol=nil
    end

    if params[:finsol]=~ /[0-3]?[0-9]\-[0-1]?[0-9]\-[0-9]{4}/
      nfin=formato_europeo(params[:finsol])
      #fecha=params[:finsol].to_s.split('-')
      #nfin=fecha[2]+"-"+fecha[1]+"-"+fecha[0]
      @periodo.finsol=nfin.to_date
    else
      @periodo.finsol=nil
    end

    respond_to do |format|
      if @periodo.save
        @periodos = Periodo.find(:all,:order=>"inicio")
        format.html { redirect_to :action => "index" }
        format.xml  { render :xml => @periodo, :status => :created, :location => @periodo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @periodo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /periodos/1
  # PUT /periodos/1.xml
  def update
    @periodo = Periodo.find(params[:id])
    @periodo.tipo=params[:tipo]
    @periodo.activo=params[:activo]=="1"
    @periodo.admision=params[:admision]=="1"

    if params[:inicio]=~ /[0-3]?[0-9]\-[0-1]?[0-9]\-[0-9]{4}/
      ninicio=formato_europeo(params[:inicio])
      @periodo.inicio=ninicio.to_date
    else
      @periodo.inicio=nil
    end
    
    if params[:fin]=~ /[0-3]?[0-9]\-[0-1]?[0-9]\-[0-9]{4}/
      nfin=formato_europeo(params[:fin])
      @periodo.fin=nfin.to_date
    else
      @periodo.fin=nil
    end

    if params[:iniciosol]=~ /[0-3]?[0-9]\-[0-1]?[0-9]\-[0-9]{4}/
      ninicio=formato_europeo(params[:iniciosol])
      @periodo.iniciosol=ninicio.to_date
    else
      @periodo.iniciosol=nil
    end

    if params[:finsol]=~ /[0-3]?[0-9]\-[0-1]?[0-9]\-[0-9]{4}/
      nfin=formato_europeo(params[:finsol])
      @periodo.finsol=nfin.to_date
    else
      @periodo.finsol=nil
    end

    respond_to do |format|
    
           if @periodo.update_attributes(params[:periodo])
              
              @periodos = Periodo.find(:all,:order=>"inicio")
              format.html { redirect_to :action => "index" }
              format.xml  { head :ok }
           else
              format.html { redirect_to :action => "edit" }
              format.xml  { render :xml => @periodo.errors, :status => :unprocessable_entity }
           end
    end
  end

  def cambia_activo 

     p=Periodo.find(params[:periodo_activo])
     if !p.activo
      if p.tipo=="Examenes"
       render :update do |page|
        page.replace_html(:'activo', :partial=>"control_adjudicacion_examen_on")
       end
      else
       render :update do |page|
        page.replace_html(:'activo', :partial=>"control_adjudicacion_on")
       end
      end
     else
       if p.tipo=="Examenes"
       render :update do |page|
        page.replace_html(:'activo', :partial=>"control_adjudicacion_examen_off")
       end
      else
       render :update do |page|
        page.replace_html(:'activo', :partial=>"control_adjudicacion_off")
       end
      end
     end
     
  end

  def enviar_correo_activo_on
   if params[:tipo]=="Lectivo"
    CorreoTecnicos::deliver_adjudicalectivo
   else
    CorreoTecnicos::deliver_adjudicaexamen
   end
    @mensaje="Correo enviado"
    render :update do |page|
        page.replace_html(:'activo', :partial=>"control_adjudicacion_on", :object=>@mensaje)
    end
  end

  def enviar_correo_activo_off
    if params[:tipo]=="Lectivo"
    CorreoTecnicos::deliver_cierreadjudicalectivo
   else
    CorreoTecnicos::deliver_cierreadjudicaexamen
   end
    @mensaje="Correo enviado"
    render :update do |page|
        page.replace_html(:'activo', :partial=>"control_adjudicacion_off", :object=>@mensaje)
    end
  end

  def grabar_historico
    
### FALTA PASAR CADA ASIGNACION AL HISTORICO
 
    asignaciones=Asignaciondef.all

    if !asignaciones.nil?
      conta=0
      asignaciones.each {|a| if a.solicitudlab.tipo=="T"
                             h=Historicoasig.new
                             h.fecha_archivo=Date.today
                             h.periodo=Periodo.find(session[:periodo]).nombre
                             h.nombre_usu=a.solicitudlab.usuario.nombre
                             h.apellidos_usu=a.solicitudlab.usuario.apellidos
                             h.nombre_asig=a.solicitudlab.asignatura.nombre_asig
                             h.nombre_tit=a.solicitudlab.asignatura.titulacion.nombre
                             h.curso=a.solicitudlab.curso
                             h.nombre_lab=a.laboratorio.nombre_lab
                             h.puestos=a.laboratorio.puestos
                             h.horaini=a.horaini
                             h.horafin=a.horafin
                             h.diasem=a.dia.nombre
                             h.save
                             conta+=1 
                             end
                             a.destroy      }
    end
   
    solicitudes=Solicitudlab.find(:all,:conditions=>["asignado = ?","D"])
    solicitudes.each{|s| 
                   peticiones= Peticionlab.find_all_by_solicitudlab_id(s.id)
                   peticiones.each{|p| p.destroy}
                   s.destroy}

    @mensaje="Grabadas en archivo historico "+conta.to_s+" asignaciones"
    render :update do |page|
        page.replace_html(:'activo', :partial=>"control_adjudicacion_off", :object=>@mensaje)
    end

  end

  def grabar_historico_examen
    
### FALTA PASAR CADA ASIGNACION AL HISTORICO
 
    asignaciones=Asignacionlabexadef.all

    if !asignaciones.nil?
      conta=0
      asignaciones.each {|a| h=Historicoasigexa.new
                             h.fecha_archivo=Date.today
                             h.periodo=Periodo.find(session[:periodo]).nombre
                             h.nombre_usu=a.solicitudlabexa.usuario.nombre
                             h.apellidos_usu=a.solicitudlabexa.usuario.apellidos
                             h.nombre_asig=a.solicitudlabexa.asignatura.nombre_asig
                             h.nombre_tit=a.solicitudlabexa.asignatura.titulacion.nombre
                             h.curso=a.solicitudlabexa.curso
                             h.nombre_lab=a.laboratorio.nombre_lab
                             h.puestos=a.laboratorio.puestos
                             h.horaini=a.horaini
                             h.horafin=a.horafin
                             h.dia=a.dia
                             h.save
                             a.destroy
                             conta+=1 }
    end

    solicitudes=Solicitudlabexa.find(:all,:conditions=>["asignado = ?","D"])
    solicitudes.each{|s| s.destroy}

    @mensaje="Grabadas en archivo historico "+conta.to_s+" asignaciones"
    render :update do |page|
        page.replace_html(:'activo', :partial=>"control_adjudicacion_examen_off", :object=>@mensaje)
    end

  end

  def cambia_admision
     session[:cambia_admision]=true

     p=Periodo.find(session[:periodo])
     if params[:periodo_admision]=="1"
       if p.tipo=="Lectivo"
       render :update do |page|
        page.replace_html(:'admision', :partial=>"control_admision_on")
       end
      else
       render :update do |page|
        page.replace_html(:'admision', :partial=>"control_admision_examen_on")
       end
      end
     else
       if p.tipo=="Lectivo"
       render :update do |page|
        page.replace_html(:'admision', :partial=>"control_admision_off")
       end
      else
       render :update do |page|
        page.replace_html(:'admision', :partial=>"control_admision_examen_off")
       end
      end
     end
     
  end


  def enviar_correo_lectivo_on
   p=Periodo.find(session[:periodo])
   if p.tipo=="Lectivo"
    CorreoTecnicos::deliver_aperturalectivo(p.nombre,formato_europeo(p.finsol))
   else
    CorreoTecnicos::deliver_aperturaexamen(p.nombre,formato_europeo(p.finsol))
   end
    @mensaje="Correo enviado"
    render :update do |page|
        page.replace_html(:'admision', :partial=>"control_admision_on", :object=>@mensaje)
    end
  end

  def enviar_correo_lectivo_off
   p=Periodo.find(session[:periodo])
   if p.tipo=="Lectivo"
    CorreoTecnicos::deliver_cierrelectivo(p.nombre)
   else
    CorreoTecnicos::deliver_cierreexamen(p.nombre)
   end
    @mensaje="Correo enviado"
    render :update do |page|
        page.replace_html(:'admision', :partial=>"control_admision_off", :object=>@mensaje)
    end
  end

def cambia_activo
     p=Periodo.find(session[:periodo])
     if params[:periodo_activo]=="1"
       if p.tipo=="Lectivo"
       render :update do |page|
        page.replace_html(:'activo', :partial=>"control_adjudicacion_on")
       end
      else
       render :update do |page|
        page.replace_html(:'activo', :partial=>"control_adjudicacion_examen_on")
       end
      end
     else
       if p.tipo=="Lectivo"
       render :update do |page|
        page.replace_html(:'activo', :partial=>"control_adjudicacion_off")
       end
      else
       render :update do |page|
        page.replace_html(:'activo', :partial=>"control_adjudicacion_examen_off")
       end
      end
     end
     
  end

def enviar_correo_activo_on
   p=Periodo.find(session[:periodo])
   if p.tipo=="Lectivo"
    CorreoTecnicos::deliver_adjudicalectivo(p.nombre)
   else
    CorreoTecnicos::deliver_adjudicaexamen(p.nombre)
   end
    @mensaje="Correo enviado"
    render :update do |page|
        page.replace_html(:'activo', :partial=>"control_adjudicacion_on", :object=>@mensaje)
    end
  end

  def enviar_correo_activo_off
   p=Periodo.find(session[:periodo])
   if p.tipo=="Lectivo"
    CorreoTecnicos::deliver_cierreadjudicalectivo(p.nombre)
   else
    CorreoTecnicos::deliver_cierreadjudicaexamen(p.nombre)
   end
    @mensaje="Correo enviado"
    render :update do |page|
        page.replace_html(:'activo', :partial=>"control_adjudicacion_off", :object=>@mensaje)
    end
  end

  # DELETE /periodos/1
  # DELETE /periodos/1.xml
  def destroy
    @periodo = Periodo.find(params[:id])
    @periodo.destroy

    respond_to do |format|
      format.html { redirect_to(periodos_url) }
      format.xml  { head :ok }
    end
  end
end
