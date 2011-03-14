class AsientosController < ApplicationController
  # GET /asientos
  # GET /asientos.xml

  def index
    @asientos = Asiento.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @asientos }
    end
  end

  # GET /asientos/1
  # GET /asientos/1.xml
  def show
    
    @asiento = Asiento.find(params[:id])
    # incluir en el modelo estos totales en forma automatica se acumulen
    @total_debe  = 0
    @total_haber = 0 
    
    @asiento.detalles.each do |detalle|
        @total_debe  += detalle.debe unless detalle.debe.nil?
        @total_haber += detalle.haber unless detalle.haber.nil?
     end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @asiento }
    end
  end

  # GET /asientos/new
  # GET /asientos/new.xml
  def new
    @asiento = Asiento.new
    @asiento.detalles << Detalle.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @asiento }
    end
  end

  # GET /asientos/1/edit
  def edit
    @asiento = Asiento.find(params[:id])
  end

  # POST /asientos
  # POST /asientos.xml
  def create
    @asiento = Asiento.new(params[:asiento])

    respond_to do |format|
      if @asiento.save
        format.html { redirect_to(@asiento, :notice => 'Asiento was successfully created.') }
        format.xml  { render :xml => @asiento, :status => :created, :location => @asiento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @asiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /asientos/1
  # PUT /asientos/1.xml
  def update
    @asiento = Asiento.find(params[:id])

    respond_to do |format|
      if @asiento.update_attributes(params[:asiento])
        format.html { redirect_to(@asiento, :notice => 'Asiento was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @asiento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /asientos/1
  # DELETE /asientos/1.xml
  def destroy
    @asiento = Asiento.find(params[:id])
    @asiento.destroy

    respond_to do |format|
      format.html { redirect_to(asientos_url) }
      format.xml  { head :ok }
    end
  end
  
  def print
    # imprimir el total de los asientos
    logger.debug 'imprimio' 
    
  end
  
  def imprimir
     require 'prawn'
     @asiento = Asiento.find(params[:id])
     @total_debe = 0
     @total_haber = 0
     
     Prawn::Document.generate('hello.pdf') do |pdf|
       pdf.text("   Asiento " + @asiento.descripcion.to_s + " del "+ @asiento.fecha.to_s)
       pdf.line_width = 2
       pdf.bounding_box [-2, 730], :width => 500, :height => 50 do
           pdf.stroke_bounds
       end  
         
       @asiento.detalles.each do |detalle|
          pdf.text(detalle.cuenta.nombre.to_s + "  " + detalle.debe.to_s + " " + detalle.haber.to_s)
          @total_debe  += detalle.debe unless detalle.debe.nil?
          @total_haber += detalle.haber unless detalle.haber.nil?
       end
       
       pdf.text("           " + @total_debe.to_s + " " + @total_haber.to_s)       
     end 
     
     respond_to do |format|
       format.html { redirect_to(asientos_url) }
       format.xml  { head :ok }
     end
   end
end