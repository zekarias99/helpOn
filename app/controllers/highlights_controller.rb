class HighlightsController < ApplicationController

  def index 
    @highlights = Highlight.all
  end

  def show
    @highlight = Highlight.find(params[:id])
  end

  def new
    @highlight = Highlight.new
  end

  def edit
    @highlight = Highlight.find(params[:id])
  end

  def create
    @highlight = Highlight.new(highlight_params)
    if @highlight.save
      flash[:notice] = "Successfully created highlight."
      redirect_to @highlight
    else
      render :action => 'new'
    end
  end

  def update
    @highlight = Highlight.find(params[:id])
    if @highlight.update_attributes(highlight_params)
      flash[:notice] = "Successfully updated highlight."
      redirect_to @highlight
    else
      render :action => 'edit'
    end
  end

  def destroy
    @highlight = Highlight.find(params[:id])
    @highlight.destroy
    flash[:notice] = "Successfully destroyed highlight."
    redirect_to highlights_url
  end

  private
  def highlight_params
    params.require(:highlight).permit(:description)
  end
end
