class ListadoController < ApplicationController

before_filter :login_requerido

  def asignacion_lectivo_impresa
    @asignacions = Asignaciondef.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asignacions }
    end
  end

  def asignacion_lectivo_usuario_impresa
    @solicitudes = Solicitudlab.find(:all,:conditions=>["usuario_id = ?",session[:user_id]])
    ids=@solicitudes.map {|s| s.id } unless @solicitudes.size==0
    @asignacions = Asignaciondef.find(:all,:conditions=> ["solicitudlab_id in (?)", ids],
					:order=>"solicitudlab_id,peticionlab_id,dia_id,laboratorio_id")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asignacions }
    end
  end

  def asignacion_examenes_impresa
    @asignacionexas = Asignacionlabexadef.find(:all,:order=>'dia,solicitudlabexa_id,laboratorio_id')


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asignacions }
    end
  end

  def asignacion_examenes_usuario_impresa
    @solicitudeslab = Solicitudlabexa.find(:all,:conditions=>["usuario_id = ?",session[:user_id]])
    ids=@solicitudeslab.map {|s| s.id } unless @solicitudeslab.size==0
    @asignacionexas = Asignacionlabexadef.find(:all,:conditions=> ["solicitudlabexa_id in (?)", ids],
					:order=>'dia,solicitudlabexa_id,laboratorio_id')
  end

end
