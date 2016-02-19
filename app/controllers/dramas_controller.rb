require 'nokogiri'
require 'open-uri'

class DramasController < ApplicationController
  before_action :set_drama, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /dramas
  # GET /dramas.json
  def index
    if user_signed_in?
      @user = current_user
      @dramas = current_user.dramas.all
      @titles = current_user.dramas.titles  
    end    
  end

  # GET /dramas/1
  # GET /dramas/1.json
  def show
    @user = current_user
  end

  # GET /dramas/new
  def new
    @user = current_user
    @drama = @user.dramas.new
  end

  # GET /dramas/1/edit
  def edit
    @user = current_user
  end

  # POST /dramas
  # POST /dramas.json
  def create
    @user = current_user
    @drama = current_user.dramas.new(drama_params)

    respond_to do |format|
      if @drama.save
        format.html { redirect_to user_drama_path(user_id: current_user.id, id: @drama.id), notice: 'Drama was successfully created.' }
        format.json { render :show, status: :created, location: @drama }
      else
        format.html { render :new }
        format.json { render json: @drama.errors, status: :unprocessable_entity }
      end
      format.js
    end
  end

  # PATCH/PUT /dramas/1
  # PATCH/PUT /dramas/1.json
  def update
    respond_to do |format|
      if @drama.update(drama_params)
        format.html { redirect_to user_drama_path(user_id: current_user.id, id: @drama.id), notice: 'Drama was successfully updated.' }
        format.json { render :show, status: :ok, location: @drama }
      else
        format.html { render :edit }
        format.json { render json: @drama.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_all
    Drama.all.each do |drama|
      drama.fetch_drama_info
      drama.save
    end
    respond_to do |format|
      format.js
    end
  end

  # DELETE /dramas/1
  # DELETE /dramas/1.json
  def destroy
    @drama.destroy
    respond_to do |format|
      format.html { redirect_to user_dramas_url(current_user), notice: 'Drama was successfully deleted.' }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drama
      @drama = current_user.dramas.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drama_params
      params.require(:drama).permit(:url, :title, :subbed, :broadcasted_at, :description, :img)
    end
end
