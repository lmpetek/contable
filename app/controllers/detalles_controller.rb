class DetallesController < ApplicationController
   def new
      @detalle = Detalle.new
      @asiento = Asiento.find(params[:asiento_id])

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @detalle }
      end
    end

    def create
      @asiento = Asiento.find(params[:asiento_id])
      @detalle = @asiento.detalles.create(params[:detalle])

      respond_to do |format|
        if @detalle.save
          format.html { redirect_to(@asiento, :notice => 'Asiento was successfully created.') }
          format.xml  { render :xml => @asiento, :status => :created, :location => @asiento }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @asiento.errors, :status => :unprocessable_entity }
        end
      end
    end

    def edit
      @asiento = Asiento.find(params[:asiento_id])
      @detalle = Detalle.find(params[:id])
    end
    
    def update
      @detalle = Detalle.find(params[:id])
      @asiento = Asiento.find(@detalle.asiento_id)

      respond_to do |format|
        if @detalle.update_attributes(params[:detalle])
          format.html { redirect_to(@asiento, :notice => 'Detalle del asiento was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @detalle.errors, :status => :unprocessable_entity }
        end
      end
    end    
end