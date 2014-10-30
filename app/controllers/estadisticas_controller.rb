class EstadisticasController < ApplicationController

before_filter :login_requerido
before_filter :admin?

def periodo_lectivo

end
def estadisticas_lectivo
  if params[:periodo][:nombre_per]=="todos"
    periodo="%"
    @todos=true
  else
    periodo=params[:periodo][:nombre_per]
    @todos=false
  end

  @registros=Historicoasig.find_by_sql("select historicoasigs.* from historicoasigs where periodo like '#{periodo}'  order by periodo,nombre_tit,nombre_asig")

  render :update do |page|
          page.replace_html(:'registros', :partial=>"/estadisticas/registros_lectivo", :object=>@registros)
  end

end

def periodo_examenes
 
end

def estadisticas_examenes
  
  @registros=Historicoasigexa.find_all_by_periodo(params[:periodo][:nombre_per])

  render :update do |page|
          page.replace_html(:'registros', :partial=>"/estadisticas/registros_examenes", :object=>@registros)
  end

end

def borrar_historico_lectivo
  registros=Historicoasig.all
  @total=0
  registros.each{|r| r.destroy
                     @total+=1}

  render :update do |page|
          page.replace_html(:'registros', :partial=>"/estadisticas/registros_lectivo_borrados", :object=>@total)
  end
end

def borrar_historico_examenes
  registros=Historicoasigexa.all
  @total=0
  registros.each{|r| r.destroy
                     @total+=1}

  render :update do |page|
          page.replace_html(:'registros', :partial=>"/estadisticas/registros_examenes_borrados", :object=>@total)
  end
end

end


