class FinePrintsController < ApplicationController

  def index 
    @fine_prints = FinePrint.all
  end

  def new
    @fine_print = FinePrint.new
  end

  def show
    @fine_print = FinePrint.find(params[:id])
  end

  def edit
    @fine_print = FinePrint.find(params[:id])
  end

  def update
    @fine_print = FinePrint.find(params[:id])
    if @fine_print.update(fine_print_params)
      flash[:notice] = "Fine Print successfully updated!"
      redirect_to @fine_print
    else
      render :edit
    end
  end

  def create    
    @fine_print = FinePrint.new(fine_print_params)
    if @fine_print.save
      flash[:notice] = "Fine print has been created."
      redirect_to @fine_print
    else
      render :new
    end
  end

  def destroy
    @fine_print = FinePrint.find(params[:id])
    @fine_print.destroy
      redirect_to fine_prints_url, alert: 'Fine print successfully deleted!'
  end

  private
   def fine_print_params 
    params.require(:fine_print).permit(:description)
  end
end

