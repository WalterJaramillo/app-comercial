class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categorias = Category.all
  end

  def new
    @categoria = Category.new
  end

  def edit   #tiene @categoria
  end

  def create
    @categoria = Category.new(category_params) #strong parameters | se crea un objeto categoria con los strong parameters

    respond_to do |format|
      if @categoria.save
        format.json { head :no_content }  #respondemos con json
        format.js                         # responde js
      else
        format.json { render json: @categoria.errors.full_messages, status: :unprocessable_entity }
        format.js { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @categoria.update(category_params)
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @categoria.errors.full_messages, status: :unprocessable_entity }
        format.js { render :edit }
      end
    end
  end

  def destroy
    @categoria.destroy
    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end

  private 
    def set_category
      @categoria = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:nombre, :descripcion) # datos permitidos desde el formulario
    end

end
