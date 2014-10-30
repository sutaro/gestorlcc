class AsignacionexasController < ApplicationController
  # GET /asignacionexas
  # GET /asignacionexas.xml

 before_filter :login_requerido
 before_filter :admin?



  # DELETE /asignacions/1
  # DELETE /asignacions/1.xml
  def destroy
    @asignacionexa = Asignacionlabexa.find(params[:id])
    @asignacionexa.destroy

    respond_to do |format|
      format.html { redirect_to(asignacionlabexas_url) }
      format.xml  { head :ok }
    end
  end


  def asignar
    @admision=Periodo.find(:all,:conditions=>["admision = ? and tipo= ?","t","Examenes"])
    @totalprov=Asignacionlabexa.all.size

  end

  def asignar_continuar
       @asignacionexas=Asignacionlabexa.all
    
      render :update do |page|
        page.replace_html(:'cuadrante', :partial=>"/asignacionexas/cuadrante", :object=>@asignacionexas)
      end
    

  end
# SI HIDDEN FIELD ES PRINCIPIO, SE LEEN SOLICITUDLAB, SINO DE ASIGNACIONEXAPROV
  def asignar_iniciar
    solicitudes=Solicitudlabexa.find(:all,:conditions=>["fecha >= ? and asignado <> ?",Date.today,"D"])
    #@adjudicado=Periodo.find(:all,:conditions=>["activo = ? and tipo= ?","t","Examenes"])
    if solicitudes.size!=0 
     
     @solicitudlabexas=solicitudes.to_a

  # ordenacion de solicitudes de examen segun metodo de ascenso de burbujas por los criterios:
  # 1- por numero de horas totales
  # 2- por numero de puestos descendentemente


     for i in 0..@solicitudlabexas.size-1
       for j in 0..@solicitudlabexas.size-2-i
         if horasexa(@solicitudlabexas[j])<horasexa(@solicitudlabexas[j+1])
             @solicitudlabexas[j],@solicitudlabexas[j+1]=@solicitudlabexas[j+1],@solicitudlabexas[j]
         end
       end
     end

      for i in 0..@solicitudlabexas.size-1
       for j in 0..@solicitudlabexas.size-2-i
         if horasexa(@solicitudlabexas[j])==horasexa(@solicitudlabexas[j+1]) and
           @solicitudlabexas[j].npuestos<@solicitudlabexas[j+1].npuestos
           @solicitudlabexas[j],@solicitudlabexas[j+1]=@solicitudlabexas[j+1],@solicitudlabexas[j]
         end
       end
     end

     # los componentes ordenados secuencialmente, se cargan en un array 3d de horas x labs x ### FECHA ####

     cuadrante=Array3d.new
     @asignacionexas=[]
   
   ####### VER FECHA EN NUMERICO ENTERO Y COMO MANTENER LA CONTINUIDAD DE HORAS (LAS DE IGUAL SOLICITUDLABEXA_ID)
    @nhoras=[]
     @solicitudlabexas.each { |sol|     #por cada una de las @solicitudlabexas, buscamos los lab que tienen ese n. de puestos
       #sol.peticionlab.each { |pet|     #por cada peticion de tramo de cada solicitud NO HAY TRAMOS
        
         # tomamos la fecha, la hora de inicio y la de fin ###### FECHA NO DIA DE LA SEMANA ##################
         dia=sol.fecha.yday  ####### poner fecha en formato enteroooooooo
         hi=Horasexa.find_by_comienzo(sol.horaini).id.to_i  #### LA SOLICITUD TIENE HORAINI
         hf=Horasexa.find_by_fin(sol.horafin).id.to_i 
         nhoras=hf-hi+1 #### las horas a partir de la inicial que ocupa el examen
         # for hora in hi..hf     #   for cada hora del tramo,una asignacionexa MIRAR SI LIBRE LA PRIMERA HORA Y LAS RESTANTES 
          @nhoras<<nhoras
          if sol.npuestos<Laboratorio::DOS_LAB 
           
            @todoslab=Laboratorio.find(:all,:order=>"nombre_lab desc",
                                      :conditions=>["puestos = ?",sol.npuestos])
            # en principio el laboratorio asignado es ninguno y buscamos uno libre de ese tamaño
            lab=nil
          if sol.preferencias=="" or sol.preferencias==nil
            @todoslab.each {|laboratorio|  
                               if sol.npuestos<=laboratorio.puestos and cuadrante[hi, laboratorio.id,dia].nil?           
                                  lab=[laboratorio.id]  # si el laboratorio está libre y cabe el num de puestos 
                               end       
                          }
               # si no habia ninguno libre, colisionamos en el primero de los lab de esa capacidad  
          else # el usuario manifesto una preferencia favorable o desfavorable
             preferencias=sol.preferencias.split(";")        # troceo la cadena de preferencias por el ;  
             preferencias.each { |p| trestramos=p.split("-") # e itero sobre cada trozo y vuelvo a trocear
                                 l=Laboratorio.find_by_nombre_lab(trestramos[0]).id    #  en 3.1.4-Apple-no por el guion
                                 if trestramos[2]=="si"      # si ha dicho que si, ahí lo coloco
                                   lab=[l]                   # si el laboratorio está libre y cabe el num de puestos
                                 else              # si ha dicho que no, elimino de la lista de laboratorios ese laboratorio
                                   @todoslab=@todoslab.reject{|n| n.id==l }
                                   @todoslab.each {|laboratorio|  #### todas las horas ######## HACER UN BUCLE DE HI A HF
                                   if sol.npuestos<=laboratorio.puestos and cuadrante[hi, laboratorio.id,dia].nil?           
                                       lab=[laboratorio.id]   
                                   end       
                                }
                                 end 
                               }
             
           end
           if lab.nil?
             lab=[@todoslab.first.id]
           end
           
          else 
           uno=Laboratorio.find_by_nombre_lab("3.1.1").id
           dos=Laboratorio.find_by_nombre_lab("3.1.2").id
           tres=Laboratorio.find_by_nombre_lab("3.1.3").id
           cinco=Laboratorio.find_by_nombre_lab("3.1.5").id
           ocho=Laboratorio.find_by_nombre_lab("3.1.8").id 
           nueve=Laboratorio.find_by_nombre_lab("3.1.9").id
           if sol.npuestos==Laboratorio::DOS_LAB
               # se asignan "a mano los lab 1 y 2 o bien el 8 y el 9 que son contiguos
                
               if cuadrante[hi,uno,dia]==nil and cuadrante[hi,dos,dia]==nil
                lab=[uno,dos]
               else 
                lab=[ocho,nueve]
                
               end #if 
           else
             lab=[uno,dos,ocho,nueve]
             if sol.npuestos==150
                 lab+=[tres,cinco]
               
             end # if == 150
           end # if == DOSLAB
          end # if < DOSLAB
           # siempre habra al menos una asignacionexa para todos
           # CONSTRUIR UNA LISTA Y UNA ITERACION  SOBRE ELLA DE ASIGNACIONES
           lab.each {|l| for hora in hi..hf
                         @asignacionexas<<asignacionexa=Asignacionlabexa.new(:solicitudlabexa_id=>sol.id,
                                                                 :laboratorio_id=>l,
                                                                 :dia=>sol.fecha,              #aqui hay cambio
                                                                 :horaini=>Horasexa.find(hora).comienzo,
                                                                 :horafin=>Horasexa.find(hora).fin,# POR CADA HORA ENTRE hi y hf
                                                                 :mov_dia=>"",
                                                                 :mov_hora=>"")
                    
                         if cuadrante[hora,l,dia].nil?
                            cuadrante[hora,l,dia]=[asignacionexa]
                         else
                            cuadrante[hora,l,dia]<<[asignacionexa]
                         end  
                         end # del for
                         # HASTA AQUI
                     }       
          #end # for horas
         
         
      #} # for pet
     }  # for sol
     
    # finalmente, se vuelcan todas las asignacionexas sobre el archivo persistente
    # eliminando primero los registros que hubiera de una asignacionexa anterior
    # OJOOOOOO VER QUE HACER CUANDO SE ACTIVEN NUEVOS PERIODOS

   
        Asignacionlabexa.all.each { |a| a.destroy }

        @asignacionexas.each { |a| nueva_asig=Asignacionlabexa.new
                            nueva_asig=a
                            a.solicitudlabexa.asignado="P"
                            a.solicitudlabexa.save
                            nueva_asig.save
                      }
    else
      @asignacionexas=[]
    end
      render :update do |page|
        page.replace_html(:'cuadrante', :partial=>"/asignacionexas/cuadrante", :object=>@asignacionexas)
      end

  end

  def grabar_asignacion
    # borrar las antiguas asignaciones definitivas
    # leer asignacionexas provisionales
    # grabarlas en definitivas
    # eliminar las provisionales
    
    
    @asignacionlabexadefs=Asignacionlabexadef.all
    if @asignacionlabexadefs.size!=0
      solicitudes=@asignacionlabexadefs.map{|a| a.solicitudlabexa_id}.uniq
      solicitudes.each{|s| sol=Solicitudlabexa.find(s)
                           sol.destroy}
      @asignacionlabexadefs.each{|a| a.destroy}
    end
    @asignacionexas=Asignacionlabexa.all
    @asignacionexas.each { |a| asig_def=Asignacionlabexadef.new(:solicitudlabexa_id=>a.solicitudlabexa_id,
                                                                 :laboratorio_id=>a.laboratorio_id,
                                                                 :dia=>a.dia,              
                                                                 :horaini=>a.horaini,
                                                                 :horafin=>a.horafin,
                                                                 :mov_dia=>a.mov_dia,
                                                                 :mov_hora=>a.mov_hora)
                            asig_def.save
                            sol=Solicitudlabexa.find(a.solicitudlabexa.id)
                            sol.asignado="D"
                            sol.save
                            a.destroy
                      }
    render :update do |page|
        page.replace_html(:'cuadrante', :partial=>"/asignacionexas/grabacion")
      end

  end


 
  def mover
    @asignacionexa=Asignacionlabexa.find(params[:id]) #coger todas las que tengan la misma solicitudlabexa_id
    inicial_dia=@asignacionexa.dia                    #mover una por una con los cambios de día u hora o lab
    inicial_hora_ini=@asignacionexa.horaini
    inicial_hora_fin=@asignacionexa.horafin
    inicial_laboratorio=@asignacionexa.laboratorio
    laboratorio_id=Laboratorio.find_by_nombre_lab(params[:laboratorio_id][:nombre_lab]).id
    horaini=Horasexa.find_by_comienzo(params[:horario_id][:comienzo]).comienzo
    horafin=Horasexa.find_by_comienzo(params[:horario_id][:comienzo]).fin
    if inicial_laboratorio!=laboratorio_id
      asignaciones=Asignacionlabexa.find(:all,
         :conditions=>['solicitudlabexa_id = ? and laboratorio_id = ?',@asignacionexa.solicitudlabexa,inicial_laboratorio])
      for asignacionexa in asignaciones # todas las que haya que modificar
        asignacionexa.update_attributes(:laboratorio_id=>laboratorio_id) 
      end 
    end
    mov_dia=""
    if formato_europeo(inicial_dia) != params[:dia][:dia]
      mov_dia=" cambio de "+inicial_dia.to_s+" a "+params[:dia][:dia].to_s+"; "
      asignaciones=Asignacionlabexa.find(:all,:conditions=>['solicitudlabexa_id = ?',@asignacionexa.solicitudlabexa])
      for asignacionexa in asignaciones # todas las que haya que modificar
        asignacionexa.update_attributes(:dia=> params[:dia][:dia], 
                                        :mov_dia=> mov_dia) 
      end  
    end
    mov_hora="" 
    if inicial_hora_ini != params[:horario_id][:comienzo]
      diferencia=Horasexa.find_by_comienzo(inicial_hora_ini).num-Horasexa.find_by_comienzo(params[:horario_id][:comienzo]).num
      mov_hora=" cambio de "+inicial_hora_ini+"-"+inicial_hora_fin+" a "+params[:horario_id][:comienzo]+"-"+horafin+"; "
      asignaciones=Asignacionlabexa.find(:all,:conditions=>['solicitudlabexa_id = ?',@asignacionexa.solicitudlabexa])
      for asignacionexa in asignaciones # todas las que haya que modificar
        asignacionexa.update_attributes(:horaini=> Horasexa.find_by_num(Horasexa.find_by_comienzo(asignacionexa.horaini).num-diferencia).comienzo,
                                        :horafin=> Horasexa.find_by_num(Horasexa.find_by_comienzo(asignacionexa.horaini).num-diferencia).fin,
                                        :mov_hora=> mov_hora )
      end  
    end
    #for asignacionexa in asignaciones # todas las que haya que modificar
    #  asignacionexa.update_attributes(:laboratorio_id=>laboratorio_id,
    #                                  :dia=> params[:dia], 
    #                                  :horaini=> params[:horario_id][:comienzo],
    #                                  :horafin=> horafin,
    #                                  :mov_dia=> mov_dia,
    #                                  :mov_hora=> mov_hora ) 
    #end    
        @asignacionexas=Asignacionlabexa.all
        render :update do |page|
          page.replace_html(:'cuadrante', :partial=>"/asignacionexas/cuadrante", :object=>@asignacionexas)
        end
     
    
  end  


  def revisar
    @asignacionexas=Asignacionlabexa.all
    cuadro=Array3d.new


    for asignacionexa in @asignacionexas
       dia=asignacionexa.dia.yday #el dia no es el de asignacionexa.peticionlab.diasemana, puede haber cambiado
       hora=Horasexa.find_by_comienzo(asignacionexa.horaini).id
       if cuadro[hora,asignacionexa.laboratorio_id,dia].nil?
          cuadro[hora,asignacionexa.laboratorio_id,dia]=1
       else
          cuadro[hora,asignacionexa.laboratorio_id,dia]+=1
       end
    end

    horas=Horasexa.all.map{|h| h.id}
    laboratorios=Laboratorio.all.map{|l| l.id}
    periodo=Periodo.find(:all,:conditions=>['tipo = ? and inicio > ?','Examenes',Date.today]).first
    

    @colision=0
    for hora in horas
      for lab in laboratorios
         for dia in periodo.inicio..periodo.fin
           if !cuadro[hora,lab,dia.yday].nil?
             @colision+=1 if cuadro[hora,lab,dia.yday]>1
           end    
            
         end
      end
    end
    render :update do |page|
          page.replace_html(:'colision', :partial=>"/asignacionexas/colisiones", :object=>@colision)
    end
  end
  
  def consulta
    @asignacionexas = Asignacionlabexadef.find(:all,:order=>'dia,solicitudlabexa_id,laboratorio_id')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asignacionexas }
    end
  end

  def asigna_directa
    @solicitudlab = Solicitudlabexa.new
   # session[:tramos_horarios]=Solicitudhoraria.new
   # session[:codigo_tramo]=0

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @solicitudlabexa }
    end
  end
#aqui debe ir otra funcion tras captar el formulario anterior

  def graba
    @solicitudlab = Solicitudlabexa.new(params[:solicitudlab])
    @solicitudlab.usuario_id = params[:usuario][:identificador].to_i
    @solicitudlab.asignatura_id = params[:asignatura][:id].to_i unless params[:asignatura].nil?
    @solicitudlab.fechasol=Date.today
    @solicitudlab.npuestos=Laboratorio.find_by_nombre_lab(params[:laboratorio_id][:nombre_lab]).puestos
    @solicitudlab.curso=params[:nivel].to_s
    @solicitudlab.comentarios=params[:comentarios].to_s
    @solicitudlab.horaini=params[:horaini][:comienzo]
    @solicitudlab.horafin=params[:horafin][:fin]
    @solicitudlab.tipo="X"
    @solicitudlab.asignado="D"
    
    if params[:fecha]=~ /[0-3]?[0-9]\-[0-1]?[0-9]\-[0-9]{4}/
      nfecha=formato_europeo(params[:fecha])
      #fecha=params[:fechafin].to_s.split('-')
      #nfechafin=fecha[2]+"-"+fecha[1]+"-"+fecha[0]
      @solicitudlab.fecha=nfecha.to_date
    else
      @solicitudlab.fecha=nil
    end
 

    respond_to do |format|
      if @solicitudlab.save
        
    # esto es lo quedebe cambiar, hay que ir a generar la asignacionexa nueva y hay que grabarla
    # y redirigir a la consulta de asignacionexas  
        l=Laboratorio.find_by_nombre_lab(params[:laboratorio_id][:nombre_lab]).id
        hi=Horasexa.find_by_comienzo(params[:horaini][:comienzo]).id.to_i
        hf=Horasexa.find_by_fin(params[:horafin][:fin]).id.to_i
        for hora in hi..hf 
           asignacionexa=Asignacionlabexadef.new(:solicitudlabexa_id=>@solicitudlab.id,
                                              :laboratorio_id=>l,
                                              
                                              :dia=>@solicitudlab.fecha,                      #aqui hay cambio
                                              :horaini=>Horasexa.find(hora).comienzo,
                                              :horafin=>Horasexa.find(hora).fin)
                               asignacionexa.save
        end
                       
    # hasta aqui --------                   
        @asignacionexas = Asignacionlabexadef.all
        format.html { redirect_to('/asignacionexas/consulta') }
        format.xml  { render :xml => @solicitudlabs, :status => :created, :location => @solicitudlabs }
      else
        format.html { render :action => "asigna_directa" }
        format.xml  { render :xml => @solicitudlabs.errors, :status => :unprocessable_entity }
      end
     end
    
    
  end



  def borranormal
    asignacionexa=Asignacionlabexa.find(params[:asigna])
    #asignacionexa.delete
    otrasasignacionexas=Asignacionlabexa.find(:all,:conditions=>['solicitudlabexa_id = ? and laboratorio_id = ?',asignacionexa.solicitudlabexa_id,asignacionexa.laboratorio_id])
    otrasasignacionexas.each {|o| o.delete }
    @asignacionexas=Asignacionlabexa.all
        render :update do |page|
          page.replace_html(:'cuadrante', :partial=>"/asignacionexas/cuadrante", :object=>@asignacionexas)
        end
  end

  def borranormalasignada
    asignacionexa=Asignacionlabexa.find(params[:asigna])
    #asignacionexa.delete
    otrasasignacionexas=Asignacionlabexa.find(:all,:conditions=>['solicitudlabexa_id = ? and laboratorio_id = ?',asignacionexa.solicitudlabexa_id,asignacionexa.laboratorio_id])
    otrasasignacionexas.each {|o| o.delete }
    @asignacionexas=Asignacionlabexa.all
        render :update do |page|
          page.replace_html(:'cuadrante2', :partial=>"/asignacionexas/cuadrante2", :object=>@asignacionexas)
        end
  end

  def borradirasignada
    asignacionexa=Asignacionlabexadef.find(params[:asigna].to_i)
    solicitudlab=Solicitudlabexa.find(asignacionexa.solicitudlabexa_id)
    otrasasignacionexas=Asignacionlabexadef.find(:all,:conditions=>['solicitudlabexa_id = ? and laboratorio_id = ?',asignacionexa.solicitudlabexa_id,asignacionexa.laboratorio_id])
    #asignacionexa.delete
    otrasasignacionexas.each {|o| o.delete }
    #solicitudlab.delete
    @asignacionexas=Asignacionlabexadef.find(:all,:order=>'dia,solicitudlabexa_id,laboratorio_id')
        render :update do |page|
          page.replace_html(:'cuadrante2', :partial=>"/asignacionexas/cuadrante2", :object=>@asignacionexas)
        end
  end

  def borradir
    asignacionexa=Asignacionlabexa.find(params[:asigna])
    solicitudlab=Solicitudlab.find(asignacionexa.solicitudlabexa_id)
    otrasasignacionexas=Asignacionlabexa.find(:all,:conditions=>['solicitudlabexa_id = ?',asignacionexa.solicitudlab_id])
    #asignacionexa.delete
    otrasasignacionexas.each {|o| o.delete }
    #solicitudlab.delete
    @asignacionexas=Asignacionlabexa.all
        render :update do |page|
          page.replace_html(:'cuadrante', :partial=>"/asignacionexas/cuadrante", :object=>@asignacionexas)
        end
  end


  def listar
    cadena=params[:query]
   # para las fechas
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
    if cadena=="-"
      cadena="sin curso"
    end
    cadena=(params[:query].nil?)? "%" : "%#{params[:query]}%"
    @titulaciones=Titulacion.find(:all,:conditions=>["abrevia||nombre LIKE ?",cadena])
    codtits=@titulaciones.map{|t| t.id}
    @asignaturas=Asignatura.find(:all,:conditions=> ["abrevia_asig||nombre_asig LIKE ? or titulacion_id in (?)",cadena,codtits])
    codasigs=@asignaturas.map { |a| a.id}
    @profesores=Usuario.find(:all,:conditions=>["nombre||apellidos LIKE ?",cadena])
    codprofs=@profesores.map {|p| p.id}
    @solicitudlabexas=Solicitudlabexa.find(:all,:conditions=>["asignatura_id in (?) or usuario_id in (?) or curso LIKE ?",codasigs,codprofs,cadena])
    codsols=@solicitudlabexas.map{|s| s.id}
    @laboratorios=Laboratorio.find(:all,:conditions=>["nombre_lab LIKE ?",cadena])
    codlabs=@laboratorios.map{|l| l.id}
    @asignacionexas=Asignacionlabexadef.find(:all,:conditions=> ["solicitudlabexa_id in (?) or laboratorio_id in (?) or dia LIKE ?",codsols,codlabs,cadena])

    #respond_to {|format| format.js }
  end
    

end
