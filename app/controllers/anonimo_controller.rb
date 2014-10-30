class AnonimoController < ApplicationController

#before_filter :login_requerido

  def general
    @asignacions = Asignaciondef.all
    if @asignacions.size!=0
     @asignacions.reject{|a| a.solicitudlab.fechafin<Date.today}
    end

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @asignacions }
    end
  end 

  def labgeneral
    @asignacionexas = Asignacionlabexadef.find(:all,:order=>'dia,solicitudlabexa_id,laboratorio_id')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asignacionexas }
    end
  end

  def new
  end
end
