class SolicitudusuariolabsController < ApplicationController

  before_filter :login_requerido,:usuario?

  def index
    @solicitudlabs= Solicitudlab.find_all_by_usuario_id(@usuario_actual.id)
    @cuenta=@solicitudlabs.size

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @solicitudusuariolab }
    end
  end


  def edit
    @solicitudlab = Solicitudlab.find(params[:id])
 
    session[:tramos_horarios]=Solicitudhoraria.new
    session[:tramos_horarios].solicitudes=Peticionlab.find_all_by_solicitudlab_id(@solicitudlab.id) 
    session[:codigo_tramo]=0
    session[:borrar]=[]

    @solicitudlab.fechaini=formato_europeo(@solicitudlab.fechaini)

    @solicitudlab.fechafin=formato_europeo(@solicitudlab.fechafin)
 


  end


def new
    @solicitudlab = Solicitudlab.new


    session[:titulacion]=Titulacion.find(:first)
    session[:nivel]=Asignatura::CURSO.first

    # esto es para crear un carro no persistente  
    session[:tramos_horarios]=Solicitudhoraria.new
    # y una identificacion de tramos horarios para poder borrarlos individualmente. Se ira decrementando
    session[:codigo_tramo]=0

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @solicitudlab }
    end
  end

  def create
    @solicitudlab = Solicitudlab.new(params[:solicitudlab])
    @solicitudlab.usuario_id = @usuario_actual.id
    @solicitudlab.asignatura_id = params[:asignatura][:id].to_i unless params[:asignatura].nil?
    @solicitudlab.fechasol=Date.today
   
    @solicitudlab.curso=params[:nivel].to_s
    @solicitudlab.npuestos=params[:npuestos].to_s
    @solicitudlab.comentarios=Iconv.conv('ascii//translit//ignore', 'utf-8', params[:comentarios])
    @solicitudlab.asignado="N"

# HACER UN DRYYYYYYY!!!!!

    periodoact=Periodo.find(:first,:conditions=>["admision = ? and tipo = ? ","t","Lectivo"])
    if periodoact.nil? # si es un user no puede cursar en periodo sin activaRRRRRRRR!!!!!!!!!
       iniperiodoact=finperiodoact=Date.today 
    else 
       iniperiodoact=periodoact.inicio
       finperiodoact=periodoact.fin
        if formato_europeo(params[:fechaini])<iniperiodoact.to_s
          params[:fechaini]=formato_europeo(iniperiodoact)
       end
       if formato_europeo(params[:fechafin])>finperiodoact.to_s
          params[:fechafin]=formato_europeo(finperiodoact)
       end
    end

    if params[:fechaini]==params[:fechafin]
       @solicitudlab.tipo="S"
    else
       if params[:fechaini]==iniperiodoact and params[:fechafin]==finperiodoact
         @solicitudlab.tipo="T"
       else
         @solicitudlab.tipo="P"
       end
    end
    
    if params[:fechaini]=~ /[0-3]?[0-9]\-[0-1]?[0-9]\-[0-9]{4}/
      nfechaini=formato_europeo(params[:fechaini])
      #fecha=params[:fechaini].to_s.split('-')
      #nfechaini=fecha[2]+"-"+fecha[1]+"-"+fecha[0]
      @solicitudlab.fechaini=nfechaini.to_date
    else
      @solicitudlab.fechaini=nil
    end
    
    if params[:fechafin]=~ /[0-3]?[0-9]\-[0-1]?[0-9]\-[0-9]{4}/
      nfechafin=formato_europeo(params[:fechafin])
      #fecha=params[:fechafin].to_s.split('-')
      #nfechafin=fecha[2]+"-"+fecha[1]+"-"+fecha[0]
      @solicitudlab.fechafin=nfechafin.to_date
    else
      @solicitudlab.fechafin=nil
    end

    pref=""
    @especiales=Laboratorio.find(:all,:conditions=>['especial=?',"t"]) 
    for especial in @especiales do
      nombre=especial.ssoo.to_s
      if params[:"#{nombre}"].to_s!='in'
        pref+=especial.nombre_lab.to_s+'-'+nombre+'-'+params[:"#{nombre}"]+";"
      end
    end
    @solicitudlab.preferencias=pref
    
    respond_to do |format|
    if session[:tramos_horarios].solicitudes.empty?           # no permitiremos una peticion sin tramos
      flash[:notice]="No hay tramos horarios en su peticion"
      format.html { redirect_to(new_solicitudusuariolab_path) }
    else
      if @solicitudlab.save
        nuevo_id=@solicitudlab.id                       
        @tramos=session[:tramos_horarios].solicitudes
        @correotramos=''
        @tramos.each {|tramo| p=Peticionlab.new
                              p.solicitudlab_id=nuevo_id
                              p.diasemana=tramo.diasemana
                              p.horaini=tramo.horaini
                              p.horafin=tramo.horafin
                              p.save 
                              @correotramos+=' - '+p.diasemana+' de '+p.horaini+' a '+p.horafin}
        CorreoTecnicos::deliver_emitesolicitudlectivo(@solicitudlab,params[:fechaini],params[:fechafin],@correotramos,"","Nueva ")                       
        @solicitudlabs = Solicitudlab.find_all_by_usuario_id(@usuario_actual.id)
        format.html { redirect_to :action => "index" }
        format.xml  { render :xml => @solicitudlabs, :status => :created, :location => @solicitudlabs }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @solicitudlabs.errors, :status => :unprocessable_entity }
      end
     end
    end
    
  end

def update
    @solicitudlab = Solicitudlab.find(params[:id])

    respond_to do |format|

# UN DRYYY!!!!!

    periodoact=Periodo.find(:first,:conditions=>["admision = ? and tipo = ? ","t","Lectivo"])
    if periodoact.nil? # si es un user no puede cursar en periodo sin activaRRRRRRRR!!!!!!!!!
       iniperiodoact=finperiodoact=Date.today 
    else 
       iniperiodoact=periodoact.inicio
       finperiodoact=periodoact.fin
        if formato_europeo(params[:fechaini])<iniperiodoact.to_s
          params[:fechaini]=formato_europeo(iniperiodoact)
       end
       if formato_europeo(params[:fechafin])>finperiodoact.to_s
          params[:fechafin]=formato_europeo(finperiodoact)
       end
    end

    
    if params[:fechaini]==params[:fechafin]
       @solicitudlab.tipo="S"
    else
       if params[:fechaini]==iniperiodoact and params[:fechafin]==finperiodoact
         @solicitudlab.tipo="T"
       else
         @solicitudlab.tipo="P"
       end
    end

    if params[:fechaini]=~ /[0-3]?[0-9]\-[0-1]?[0-9]\-[0-9]{4}/
      nfechaini=formato_europeo(params[:fechaini])
      #fecha=params[:fechaini].to_s.split('-')
      #nfechaini=fecha[2]+"-"+fecha[1]+"-"+fecha[0]
    end
    
    if params[:fechafin]=~ /[0-3]?[0-9]\-[0-1]?[0-9]\-[0-9]{4}/
      nfechafin=formato_europeo(params[:fechafin])
      #fecha=params[:fechafin].to_s.split('-')
      #nfechafin=fecha[2]+"-"+fecha[1]+"-"+fecha[0]
    end

   pref=""
    @especiales=Laboratorio.find(:all,:conditions=>['especial=?',"t"]) 
    for especial in @especiales do
      nombre=especial.ssoo.to_s
      if params[:"#{nombre}"].to_s!='in'
        pref+=especial.nombre_lab.to_s+'-'+nombre+'-'+params[:"#{nombre}"]+";"
      end
    end
    @solicitudlab.preferencias=pref

    if session[:tramos_horarios].solicitudes.empty?           # no permitiremos una peticion sin tramos
      flash[:notice]="No hay tramos horarios en su peticion"
      format.html { redirect_to(edit_solicitudusuariolab_path(@solicitudlab)) }
    else
      if @solicitudlab.update_attributes(:fechaini => nfechaini,
                                             :fechafin => nfechafin,
                                             :usuario_id => @usuario_actual.id,
                                             :asignatura_id => params[:asignatura][:id].to_i,
                                             :curso => params[:nivel].to_s,
					     :npuestos => params[:npuestos].to_s,
					     :fechasol => Date.today,
                                             :comentarios => Iconv.iconv('ascii//translit//ignore', 'utf-8', params[:comentarios]))

        @tramos=session[:tramos_horarios].solicitudes
        @tramos.each {|tramo| if tramo.id.to_i<0
                                p=Peticionlab.new
                                p.solicitudlab_id=@solicitudlab.id
                                p.diasemana=tramo.diasemana
                                p.horaini=tramo.horaini
                                p.horafin=tramo.horafin
                                p.save
                              end  }
        @borrados=session[:borrar]
        @borrados.each {|tramo| if tramo.to_i > 0
                                  reg=Peticionlab.find(tramo)
                                  reg.destroy
                                end } unless @borrados.empty?

        # flash[:notice] = 'Solicitudrecurso was successfully updated.'
        CorreoTecnicos::deliver_emitesolicitudlectivo(@solicitudlab,params[:fechaini],params[:fechafin],@correotramos,"","Cambios en ")      
        @solicitudlabs = Solicitudlab.find_all_by_usuario_id(@usuario_actual.id)
        format.html { redirect_to :action => "index" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @solicitudusuariolab.errors, :status => :unprocessable_entity }
      end
    end
    end
  end
  # DELETE /solicitudlabs/1
  # DELETE /solicitudlabs/1.xml
 def destroy
    @solicitudlab = Solicitudlab.find(params[:id])
    @solicitudlab.destroy
    @tramos=Peticionlab.find_all_by_solicitudlab_id(@solicitudlab.id) # busco todos los tramos que tenian el id
    @tramos.each {|tramo| tramo.destroy} # los elimino en cascada
    CorreoTecnicos::deliver_emitesolicitudlectivo(@solicitudlab,params[:fechaini],params[:fechafin],@correotramos,"","Borrado de ")      
    respond_to do |format|
      format.html { redirect_to(solicitudusuariolabs_url) }
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
    
    
    @asignaturas=Asignatura.find(:all,:conditions=> ["nombre_asig || curso LIKE ?",cadena])
    codigos_a=@asignaturas.map { |t| t.id}
    @tramos=Peticionlab.find(:all,:conditions=> ["diasemana || horaini || horafin LIKE ?",cadena])
    codigos_t=@tramos.map { |t| t.solicitudlab_id}
    @labs_especiales=Laboratorio.find(:all,:conditions=> ["ssoo || nombre_lab like ? and especial=?",cadena,"t"])
    nombre_l=@labs_especiales.map {|l| l.nombre_lab+'-'+l.ssoo+'-'+'si'+';'}
    nombre_l=nombre_l+@labs_especiales.map {|l| l.nombre_lab+'-'+l.ssoo+'-'+'no'+';'}
    @solicitudlabs=Solicitudlab.find(:all,:conditions=> ["usuario_id == ? and (npuestos || curso || fechaini || fechafin || fechasol LIKE ? or asignatura_id in (?) or id in (?) or preferencias in (?))", session[:user_id],cadena, codigos_a, codigos_t,nombre_l])
    @cuenta=@solicitudlabs.size
    #respond_to {|format| format.js }
  end

end
