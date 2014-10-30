class RecursosController < ApplicationController
  # GET /recursos
  # GET /recursos.xml
before_filter :login_requerido, :admin?

  def index
    @recursos = Recurso.find(:all,:order=>"descripcion") 
    @cuenta=@recursos.size

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recursos }
    end
  end


  # GET /recursos/new
  # GET /recursos/new.xml
  def new
    @recurso = Recurso.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recurso }
    end
  end

  # GET /recursos/1/edit
  def edit
    @recurso = Recurso.find(params[:id])
  end

  # POST /recursos
  # POST /recursos.xml
  def create
    @recurso = Recurso.new(params[:recurso])

    respond_to do |format|
      if @recurso.save
      #  flash[:notice] = 'El recurso fue creado con &eacute;xito.'
        @recursos = Recurso.find(:all,:order=>"descripcion") 
        format.html { redirect_to :action => "index" }
        format.xml  { render :xml => @recurso, :status => :created, :location => @recurso }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recurso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recursos/1
  # PUT /recursos/1.xml
  def update
    @recurso = Recurso.find(params[:id])

    respond_to do |format|
      if @recurso.update_attributes(params[:recurso])
        #flash[:notice] = 'El recurso fue actualizado con &eacute;xito.'
        @recursos = Recurso.find(:all,:order=>"descripcion") 
        format.html { redirect_to :action => "index" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recurso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recursos/1
  # DELETE /recursos/1.xml
  def destroy
    @recurso = Recurso.find(params[:id])
    @recurso.destroy

    respond_to do |format|
      format.html { redirect_to(recursos_url) }
      format.xml  { head :ok }
    end
  end

  def listar
    cadena=(params[:query].nil?)? "%" : "%#{params[:query]}%"
    @recursos=Recurso.find(:all,:conditions=> ["descripcion||identificador||caracteristicas LIKE ?",cadena])
    @cuenta=@recursos.size
    #respond_to {|format| format.js }
  end





end
