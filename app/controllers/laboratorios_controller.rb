class LaboratoriosController < ApplicationController
  # GET /laboratorios
  # GET /laboratorios.xml

before_filter :login_requerido, :admin?

  def index
    @laboratorios = Laboratorio.find(:all,:order=>"nombre_lab")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @laboratorios }
    end
  end

  # GET /laboratorios/1
  # GET /laboratorios/1.xml
 # def show
 #   @laboratorio = Laboratorio.find(params[:id])

 #   respond_to do |format|
 #     format.html # show.html.erb
 #     format.xml  { render :xml => @laboratorio }
 #   end
 # end

  # GET /laboratorios/new
  # GET /laboratorios/new.xml
  def new
    @laboratorio = Laboratorio.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @laboratorio }
    end
  end

  # GET /laboratorios/1/edit
  def edit
    @laboratorio = Laboratorio.find(params[:id])
  end

  # POST /laboratorios
  # POST /laboratorios.xml
  def create
    @laboratorio = Laboratorio.new(params[:laboratorio])

    respond_to do |format|
      if @laboratorio.save
        #flash[:notice] = 'Laboratorio fue creado con &eacute;xito.'
        @laboratorios = Laboratorio.find(:all,:order=>"nombre_lab")
        format.html { redirect_to :action => "index" }
        format.xml  { render :xml => @laboratorio, :status => :created, :location => @laboratorio }
      else
        format.html { render :action => "index" }
        format.xml  { render :xml => @laboratorio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /laboratorios/1
  # PUT /laboratorios/1.xml
  def update
    @laboratorio = Laboratorio.find(params[:id])

    respond_to do |format|
      if @laboratorio.especial and !params[:laboratorio][:especial] 
         @solicitudeslab=Solicitudlab.find(:all,:conditions=>["preferencias LIKE ?","%"+@laboratorio.nombre_lab+"%"])
         @solicitudeslab.each {|s|  prefs=s.preferencias.split(';')
                                    prefsfinal=''
                                    prefs.each{ |p|  if !p.index(@laboratorio.nombre_lab)
                                                        prefsfinal+=p+';'
                                                     end}
                                    s.update_attributes(:preferencias=>prefsfinal)
                               }
      end
      if @laboratorio.update_attributes(params[:laboratorio])
       
       # flash[:notice] = 'Laboratorio fue actualizado con &eacute;xito.'
        @laboratorios = Laboratorio.find(:all,:order=>"nombre_lab")
        format.html { redirect_to :action => "index" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @laboratorio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratorios/1
  # DELETE /laboratorios/1.xml
  def destroy
    @laboratorio = Laboratorio.find(params[:id])
    @laboratorio.destroy

    respond_to do |format|
      format.html { redirect_to(laboratorios_url) }
      format.xml  { head :ok }
    end
  end
end
