class NinjasController < ApplicationController

  def index
    @ninjas = Ninja.all
  end

  def new
    @ninja = Ninja.new
    @ninjas = Ninja.where(user_id: current_user.id)
  end

  def create
    @ninja = Ninja.new(ninja_params)
    @ninja.user_id = current_user.id
    respond_to do |format|
      if @ninja.save
        format.html { redirect_to new_ninja_path, notice: "Ninja was successfully created." }
        format.json # Follows the classic Rails flow and look for a create.json view
      else
        format.html { render "ninjas/new", status: :unprocessable_entity }
        format.json # Follows the classic Rails flow and look for a create.json view
      end
    end
  end

  def show
    @ninja = Ninja.find(params[:id])
  end

  def edit
    @ninja = Ninja.find(params[:id])
  end

  def update
    @ninja = Ninja.find(params[:id])
    if @ninja.update(ninja_params)
      redirect_to ninja_path(@ninja)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @ninja = Ninja.find(params[:id])
    if @ninja.destroy
      redirect_to ninjas_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def search
  end

  private

  def ninja_params
    params.require(:ninja).permit(:name, :address, :photo, :num_tel, :specialty, :description)
  end
end
