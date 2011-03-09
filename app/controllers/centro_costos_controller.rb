class CentroCostosController < ApplicationController
  # GET /centro_costos
  # GET /centro_costos.xml
  def index
    @centro_costos = CentroCosto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @centro_costos }
    end
  end

  # GET /centro_costos/1
  # GET /centro_costos/1.xml
  def show
    @centro_costo = CentroCosto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @centro_costo }
    end
  end

  # GET /centro_costos/new
  # GET /centro_costos/new.xml
  def new
    @centro_costo = CentroCosto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @centro_costo }
    end
  end

  # GET /centro_costos/1/edit
  def edit
    @centro_costo = CentroCosto.find(params[:id])
  end

  # POST /centro_costos
  # POST /centro_costos.xml
  def create
    @centro_costo = CentroCosto.new(params[:centro_costo])

    respond_to do |format|
      if @centro_costo.save
        format.html { redirect_to(@centro_costo, :notice => 'Centro costo was successfully created.') }
        format.xml  { render :xml => @centro_costo, :status => :created, :location => @centro_costo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @centro_costo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /centro_costos/1
  # PUT /centro_costos/1.xml
  def update
    @centro_costo = CentroCosto.find(params[:id])

    respond_to do |format|
      if @centro_costo.update_attributes(params[:centro_costo])
        format.html { redirect_to(@centro_costo, :notice => 'Centro costo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @centro_costo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /centro_costos/1
  # DELETE /centro_costos/1.xml
  def destroy
    @centro_costo = CentroCosto.find(params[:id])
    @centro_costo.destroy

    respond_to do |format|
      format.html { redirect_to(centro_costos_url) }
      format.xml  { head :ok }
    end
  end
end
