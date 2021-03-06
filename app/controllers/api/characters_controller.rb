class Api::CharactersController < ApplicationController
  before_action :set_character, only: [:show, :update, :destroy]

  # GET /characters
  def index
    @characters = Character.all
    limit = params[:_limit]

    if limit.present?
      limit = limit.to_i
      @characters = @characters.last(limit)
    end

    render json: @characters
  end

  # GET /characters/1
  def show
    # render json: @character
    image_url = URI::join(Rails.application.routes.url_helpers.root_url, rails_blob_path(@character.image) ) 
    show = {
      "id": @character.id,
      "name": @character.name,
      "status": @character.status,
      "born": @character.born,
      "species": @character.species,
      "planet": @character.planet,
      "occupations": @character.occupations,
      "description": @character.description,
      "gender": @character.gender,
      "image": image_url,
      "episode": @character.episode,
      "url": @character.url,
      "created_at": @character.created_at,
      "updated_at": @character.updated_at
      }
    render json: show
  end

  # POST /characters
  def create
    @character = Character.new(character_params)
    @character.image.attach(params[:character][:image]) if params.dig(:character, :image).present?
    if @character.save
      render json: @character, status: :created, location: @character
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /characters/1
  def update
    @character.image.attach(params[:character][:image]) if params.dig(:character, :image).present?
    if @character.update(character_params)
      render json: @character
    else
      render json: @character.errors, status: :unprocessable_entity
    end
  end

  # DELETE /characters/1
  def destroy
    @character.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def character_params
      params.require(:character).permit(:id, :name, :status, :born, :species, :planet, :occupations, :description, :gender, :episode, :url, :_limit)
    end     
end
