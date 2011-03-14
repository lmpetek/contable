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
      @detalle = Detalle.find(params[:id])
    end
end

