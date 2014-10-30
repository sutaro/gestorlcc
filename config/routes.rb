ActionController::Routing::Routes.draw do |map|
  #map.resources :asignacions

  map.resources :periodos

  map.resources :peticionlabs

  map.resources :solicitudlabs

  map.resources :solicitudlabexas

  map.resources :dias

  map.resources :horarios

  map.resources :horasexas

  map.resources :peticions

  map.resources :solicitudrecursos

  map.resources :titulacions

  map.resources :recursos

  map.resources :laboratorios

  map.resources :asignaturas

  

  map.resources :usuarios
  map.resource :solicitar
  map.resource :session 
  map.resource :inicio
  map.resource :userinicio
  map.resource :dato
  map.resource :solicitudrecurso
  map.resources :solicitudrecursousuarios
  map.resources :solicitudusuariolabs
  map.resources :solicitudusuariolabexas

  map.cambiar 'usuarios/:id/cambiar', :controller => 'usuarios', :action =>'cambiar' 
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
map.root :controller => 'sessions'

map.connect 'anonimo/new', :controller=>'anonimo',:action=>'new'
map.connect 'anonimo/general', :controller=>'anonimo',:action=>'general'
map.connect 'anonimo/labgeneral', :controller=>'anonimo',:action=>'labgeneral'
map.connect 'estadisticas/periodo_lectivo', :controller=>'estadisticas',:action=>'periodo_lectivo'
map.connect 'estadisticas/periodo_examenes', :controller=>'estadisticas',:action=>'periodo_examenes'
map.connect 'estadisticas/estadisticas_lectivo', :controller=>'estadisticas',:action=>'estadisticas_lectivo'
map.connect 'estadisticas/estadisticas_examenes', :controller=>'estadisticas',:action=>'estadisticas_examenes'
map.connect 'estadisticas/borrar_historico_lectivo', :controller=>'estadisticas',:action=>'borrar_historico_lectivo'
map.connect 'estadisticas/borrar_historico_examenes', :controller=>'estadisticas',:action=>'borrar_historico_examenes'
map.connect 'periodos/cambia_admision', :controller=>'periodos',:action=>'cambia_admision'
map.connect 'periodos/cambia_activo', :controller=>'periodos',:action=>'cambia_activo'
map.connect 'periodos/enviar_correo_lectivo_on', :controller=>'periodos',:action=>'enviar_correo_lectivo_on'
map.connect 'periodos/enviar_correo_activo_off', :controller=>'periodos',:action=>'enviar_correo_activo_off'
map.connect 'periodos/enviar_correo_activo_on', :controller=>'periodos',:action=>'enviar_correo_activo_on'
map.connect 'periodos/enviar_correo_lectivo_off', :controller=>'periodos',:action=>'enviar_correo_lectivo_off'
map.connect 'periodos/grabar_historico', :controller=>'periodos',:action=>'grabar_historico'
map.connect 'periodos/grabar_historico_examen', :controller=>'periodos',:action=>'grabar_historico_examen'
map.connect 'solicitar/anadir', :controller=>'solicitar', :action=>'anadir'
map.connect 'solicitar/eliminar', :controller=>'solicitar', :action=>'eliminar'
map.connect 'asignaturas/combo_por_titulacion', :controller => 'asignaturas', :action => 'combo_por_titulacion'
map.connect 'asignaturas/combo_por_descripcion', :controller => 'recursos', :action => 'combo_por_descripcion'
map.connect 'asignaturas/combo_por_nivel', :controller => 'asignaturas', :action => 'combo_por_nivel'
map.connect 'usuarios/listar', :controller => 'usuarios', :action=> 'listar'
map.connect 'asignaturas/listar', :controller => 'asignaturas', :action=> 'listar'
map.connect 'recursos/listar', :controller => 'recursos', :action=> 'listar'
map.connect 'solicitudlabs/listar', :controller => 'solicitudlabs', :action=> 'listar'
map.connect 'solicitudlabexas/listar', :controller => 'solicitudlabexas', :action=> 'listar'
map.connect 'solicitudusuariolabexas/listar', :controller => 'solicitudusuariolabexas', :action=> 'listar'
map.connect 'solicitudrecursos/listar', :controller => 'solicitudrecursos', :action=> 'listar'
map.connect 'solicitudrecursos/borrar_reservas', :controller => 'solicitudrecursos', :action=> 'borrar_reservas'
map.connect 'solicitudrecursousuarios/listar', :controller => 'solicitudrecursousuarios', :action=> 'listar'
map.connect 'solicitudrecursousuarios/buscar', :controller => 'solicitudrecursousuarios', :action=> 'buscar'
map.connect 'solicitudusuariolabs/listar', :controller => 'solicitudusuariolabs', :action=> 'listar'
map.connect 'solicitudrecursos/buscar', :controller => 'solicitudrecursos', :action=> 'buscar'
map.connect 'solicitudrecursos/crear', :controller => 'solicitudrecursos', :action=> 'crear'
map.connect 'solicitudrecursos/borra', :controller => 'solicitudrecursos', :action=> 'borra'
map.connect 'solicitudrecursousuarios/borra', :controller => 'solicitudrecursousuarios', :action=> 'borra'

map.connect 'asignacions/mover', :controller => 'asignacions', :action=> 'mover'
map.connect 'asignacions/revisar', :controller => 'asignacions', :action=> 'revisar'
map.connect 'asignacions/asignar', :controller => 'asignacions', :action=> 'asignar'
map.connect 'asignacions/asignar_iniciar', :controller => 'asignacions', :action=> 'asignar_iniciar'
map.connect 'asignacions/asignar_continuar', :controller => 'asignacions', :action=> 'asignar_continuar'
map.connect 'asignacions/grabar_parcial', :controller => 'asignacions', :action=> 'grabar_parcial'
map.connect 'asignacions/grabar_asignacion', :controller => 'asignacions', :action=> 'grabar_asignacion'
map.connect 'asignacions/index', :controller => 'asignacions', :action=> 'index'
map.connect 'asignacions/consulta', :controller => 'asignacions', :action=> 'consulta'
map.connect 'asignacions/asigna_directa', :controller => 'asignacions', :action=> 'asigna_directa'
map.connect 'asignacions/graba', :controller => 'asignacions', :action=> 'graba'
map.connect 'asignacions/borradir', :controller => 'asignacions', :action=> 'borradir'
map.connect 'asignacions/borradirasignada', :controller => 'asignacions', :action=> 'borradirasignada'
map.connect 'asignacions/borranormal', :controller => 'asignacions', :action=> 'borranormal'
map.connect 'asignacions/borranormalasignada', :controller => 'asignacions', :action=> 'borranormalasignada'
map.connect 'listado/asignacion_lectivo_impresa', :controller => 'listado', :action=> 'asignacion_lectivo_impresa'
map.connect 'listado/asignacion_examenes_impresa', :controller => 'listado', :action=> 'asignacion_examenes_impresa'
map.connect 'listado/asignacion_lectivo_usuario_impresa', :controller => 'listado', :action=> 'asignacion_lectivo_usuario_impresa'
map.connect 'listado/asignacion_examenes_usuario_impresa', :controller => 'listado', :action=> 'asignacion_examenes_usuario_impresa'

map.connect 'consultasasig/asignar', :controller => 'consultasasig', :action=> 'asignar'
map.connect 'consultasasig/porusuario', :controller => 'consultasasig', :action=> 'porusuario'
map.connect 'consultasasig/general', :controller => 'consultasasig', :action=> 'general'
map.connect 'consultasasig/labgeneral', :controller => 'consultasasig', :action=> 'labgeneral'
map.connect 'consultasasig/labporusuario', :controller => 'consultasasig', :action=> 'labporusuario'
map.connect 'consultasasig/listar', :controller => 'consultasasig', :action=> 'listar'

map.connect 'asignacionexas/mover', :controller => 'asignacionexas', :action=> 'mover'
map.connect 'asignacionexas/revisar', :controller => 'asignacionexas', :action=> 'revisar'
map.connect 'asignacionexas/asignar', :controller => 'asignacionexas', :action=> 'asignar'
map.connect 'asignacionexas/asignar_iniciar', :controller => 'asignacionexas', :action=> 'asignar_iniciar'
map.connect 'asignacionexas/asignar_continuar', :controller => 'asignacionexas', :action=> 'asignar_continuar'
map.connect 'asignacionexas/grabar_parcial', :controller => 'asignacionexas', :action=> 'grabar_parcial'
map.connect 'asignacionexas/grabar_asignacion', :controller => 'asignacionexas', :action=> 'grabar_asignacion'
map.connect 'asignacionexas/index', :controller => 'asignacionexas', :action=> 'index'
map.connect 'asignacionexas/consulta', :controller => 'asignacionexas', :action=> 'consulta'
map.connect 'asignacionexas/asigna_directa', :controller => 'asignacionexas', :action=> 'asigna_directa'
map.connect 'asignacionexas/graba', :controller => 'asignacionexas', :action=> 'graba'
map.connect 'asignacionexas/borradir', :controller => 'asignacionexas', :action=> 'borradir'
map.connect 'asignacionexas/borradirasignada', :controller => 'asignacionexas', :action=> 'borradirasignada'
map.connect 'asignacionexas/borranormal', :controller => 'asignacionexas', :action=> 'borranormal'
map.connect 'asignacionexas/borranormalasignada', :controller => 'asignacionexas', :action=> 'borranormalasignada'
map.connect 'asignacionexas/listar', :controller => 'asignacionexas', :action=> 'listar'
map.connect 'consultasasigexa/asignar', :controller => 'consultasasigexa', :action=> 'asignar'
map.connect 'consultasasigexa/porusuario', :controller => 'consultasasigexa', :action=> 'porusuario'
map.connect 'consultasasigexa/general', :controller => 'consultasasigexa', :action=> 'general'


  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.

 # map.connect ':controller/:action/:id'
 # map.connect ':controller/:action/:id.:format'

end
