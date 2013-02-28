class ConsultoriosController < ApplicationController
  
  def new
    @consultorio = Consultorio.new
  end
  
  def show
    @consultorio = Consultorio.find(params[:id])
  end
  
  def create
    @consultorio = Consultorio.new(params[:consultorio])
    if @consultorio.save
      flash[:success] = "Consultorio registrado exitosamente!"
      redirect_to @consultorio # consultorio_path(@consultorio)
    else
      redirect_to 'new'
    end
  end
  
  def edit
    @consultorio = Consultorio.find(params[:id])
  end
  
  def update
    @consultorio = Consultorio.find(params[:id])
    if @consultorio.update_attributes(params[:consultorio])
      flash[:success] = "Consultorio actualizado exitosamente!"
      redirect_to @consultorio
    else
      flash[:alert] = "Error al actualizar el consultorio #{@consultorio.name}"
      render 'edit'
    end
  end
  
  def destroy
    Consultorio.find(params[:id]).destroy
    flash[:success] = "Consultorio eliminado"
    redirect_to consultorios_path
  end
  
end
