# encoding: utf-8

#iso-8859-10
class CorreoTecnicos < ActionMailer::Base
  
  def aperturalectivo(nombre,fechafin)
    buzones= 'a@a.com'
    @subject  =  'Apertura del plazo de solicitudes de reservas de laboratorios (periodo lectivo)'
    @recipients= 'a@a.com'
    @from      = 'a@a.com' 
    @sent_on   = Time.now
    
    body["nombre"]=nombre
    body["fechafin"]=fechafin
  end

  def aperturaexamen(nombre,fechafin)
    buzones='a@a.com'
    @subject  =  'Apertura del plazo de solicitudes de reservas de laboratorios (examenes)'
    @recipients ='a@a.com'
    @from= 'a@a.com'  
    @sent_on =   Time.now
    
    body["nombre"]=nombre
    body["fechafin"]=fechafin
  end



  def cierrelectivo(nombre)
    buzones='a@a.com'
    @subject  =  'Cierre del plazo de solicitudes de reservas de laboratorios (periodo lectivo)'
    @recipients='a@a.com' 
    @from     = 'a@a.com'
    @sent_on  =  Time.now
    
    body["nombre"]=nombre
  end

  def cierreexamen(nombre)
    buzones='a@a.com'
    @subject   = 'Cierre del plazo de solicitudes de reservas de laboratorios (examenes)'
    @recipients ='a@a.com'
    @from = 'a@a.com'
    @sent_on    =Time.now
    
    body["nombre"]=nombre
  end

  def adjudicalectivo(nombre)
    buzones='a@a.com'
    @subject =  'Apertura de consultas de adjudicaciones de laboratorios (periodo lectivo)'
    @recipients='a@a.com'
    @from  = 'a@a.com'
    @sent_on   = Time.now
    
    body["nombre"]=nombre
  end

  def adjudicaexamen(nombre)
    buzones='a@a.com'
    @subject =   'Apertura de consultas de adjudicaciones de laboratorios (examenes)'
    @recipients='a@a.com'
    @from    = 'a@a.com'
    @sent_on  =  Time.now
    
    body["nombre"]=nombre
  end

  def cierreadjudicalectivo(nombre)
    buzones='a@a.com'
    @subject =   'Clausura de consultas de adjudicaciones de laboratorios (periodo lectivo)'
    @recipients= 'a@a.com'
    @from  = 'a@a.com'
    sent_on   = Time.now
    
    body["nombre"]=nombre
   
  end

  def cierreadjudicaexamen(nombre)
    buzones='a@a.com'
    @subject =   'Clausura de consultas de adjudicaciones de laboratorios (examenes)'
    @recipients='a@a.com'
    @from  = 'a@a.com'
    @sent_on  =  Time.now
    
    body["nombre"]=nombre
  end

  def emitesolicitudlectivo(solicitudlab,fechaini,fechafin,tramos,emisor,tipo)
    buzon='a@a.com'
    @subject =   tipo+'solicitud de laboratorio (periodo lectivo)'
    @recipients= 'a@a.com'
    @from   =    buzon
    @sent_on  = Time.now
    
    body["fecha"]=solicitudlab.fechasol
    body["usuario"]=solicitudlab.usuario.nombre+' '+solicitudlab.usuario.apellidos
    body["asignatura"]=solicitudlab.asignatura.nombre_asig
    body["titulacion"]=solicitudlab.asignatura.titulacion.nombre
    body["curso"]=solicitudlab.curso
    body["npuestos"]=solicitudlab.npuestos
    body["fechaini"]=fechaini
    body["fechafin"]=fechafin
    body["tramos"]=tramos
    body["preferencias"]=solicitudlab.preferencias
    body["comentarios"]=solicitudlab.comentarios
    body["emisor"]=emisor
    body["tipo"]=tipo

  end
 
  def emitesolicitudexamen(solicitudlabexa,fecha,emisor,tipo)
    buzon='a@a.com'
    @subject =   tipo+'solicitud de laboratorio (examenes)'
    @recipients = 'a@a.com'
    @from  = buzon 
    @sent_on  =  Time.now
    
    body["usuario"]=solicitudlabexa.usuario.nombre+' '+solicitudlabexa.usuario.apellidos
    body["asignatura"]=solicitudlabexa.asignatura.nombre_asig
    body["titulacion"]=solicitudlabexa.asignatura.titulacion.nombre
    body["curso"]=solicitudlabexa.curso
    body["npuestos"]=solicitudlabexa.npuestos
    body["fecha"]=fecha
    body["horaini"]=solicitudlabexa.horaini
    body["horafin"]=solicitudlabexa.horafin
    body["preferencias"]=solicitudlabexa.preferencias
    body["comentarios"]=solicitudlabexa.comentarios
    body["emisor"]=emisor
    body["tipo"]=tipo
  end

end
