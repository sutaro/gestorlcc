class TitulacionsController < ApplicationController
  # GET /titulacions
  # GET /titulacions.xml

before_filter :login_requerido, :admin?

  def index
    @titulacions = Titulacion.find(:all,:order=>"id")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @titulacions }
    end
  end

  # GET /titulacions/1
  # GET /titulacions/1.xml
  #def show
  #  @titulacion = Titulacion.find(params[:id])

  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.xml  { render :xml => @titulacion }
  #  end
  #end

  # GET /titulacions/new
  # GET /titulacions/new.xml
  def new
    @titulacion = Titulacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @titulacion }
    end
  end

  # GET /titulacions/1/edit
  def edit
    @titulacion = Titulacion.find(params[:id])
  end

  # POST /titulacions
  # POST /titulacions.xml
  def create
    @titulacion = Titulacion.new(params[:titulacion])

    respond_to do |format|
      if @titulacion.save
       # flash[:notice] = 'Titulacion was successfully created.'
        @titulacions = Titulacion.find(:all,:order=>"abrevia")
        format.html { redirect_to :action => "index" }
        format.xml  { render :xml => @titulacion, :status => :created, :location => @titulacion }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @titulacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /titulacions/1
  # PUT /titulacions/1.xml
  def update
    @titulacion = Titulacion.find(params[:id])

    respond_to do |format|
      if @titulacion.update_attributes(params[:titulacion])
     #   flash[:notice] = 'Titulacion was successfully updated.'
        @titulacions = Titulacion.find(:all,:order=>"abrevia")
        format.html { redirect_to :action => "index"  }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @titulacion.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /titulacions/1
  # DELETE /titulacions/1.xml
  def destroy
    @titulacion = Titulacion.find(params[:id])
    @titulacion.destroy

    respond_to do |format|
      format.html { redirect_to(titulacions_url) }
      format.xml  { head :ok }
    end
  end
end
