require 'nokogiri'
require 'open-uri'

class DramasController < ApplicationController
  before_action :set_drama, only: [:show, :edit, :update, :destroy]

  # GET /dramas
  # GET /dramas.json
  def index
    @dramas = Drama.all
    @titles = Drama.titles
    @last_update = Drama.order(:created_at).last.created_at
  end

  # GET /dramas/1
  # GET /dramas/1.json
  def show
    
  end

  # GET /dramas/new
  def new
    @drama = Drama.new
  end

  # GET /dramas/1/edit
  def edit
  end

  # POST /dramas
  # POST /dramas.json
  def create
    @drama = Drama.new(drama_params)

    respond_to do |format|
      if @drama.save
        format.html { redirect_to @drama, notice: 'Drama was successfully created.' }
        format.json { render :show, status: :created, location: @drama }
      else
        format.html { render :new }
        format.json { render json: @drama.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dramas/1
  # PATCH/PUT /dramas/1.json
  def update
    respond_to do |format|
      if @drama.update(drama_params)
        format.html { redirect_to @drama, notice: 'Drama was successfully updated.' }
        format.json { render :show, status: :ok, location: @drama }
      else
        format.html { render :edit }
        format.json { render json: @drama.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dramas/1
  # DELETE /dramas/1.json
  def destroy
    @drama.destroy
    respond_to do |format|
      format.html { redirect_to dramas_url, notice: 'Drama was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drama
      @drama = Drama.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drama_params
      params.require(:drama).permit(:url, :title, :subbed, :broadcasted_at, :description, :img)
    end
end
