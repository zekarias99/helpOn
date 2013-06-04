class StatesController < ApplicationController
  
  def index
    @states = State.all
  end

  def show
    @state = State.find(params[:id])
  end

  def new
    @state = State.new
  end

  def edit
    @state = State.find(params[:id])
  end

  def create
    @state = State.new(state_params)
    if @state.save
      flash[:notice] = "Successfully created state "
      redirect_to states_path
    else
      render 'new'
    end
  end

  def update
    @state = State.find(params[:id])
    if @state.update(state_params)
      flash[:notice] = "Successfully updated state."
      redirect_to states_url
    else
      render 'edit'
    end
  end

  def destroy
    @state = State.find(params[:id])
    @state.destroy
    flash[:notice] = "Successfully removed state."
    redirect_to states_url
  end

  private

  def state_params
    params.require(:state).permit(:name, :abbreviation)
  end
end

