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
    # image = "{\"image\": \"#{haha}\"}"
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
    # show = "{
      # \"id\":#{@character.id},
    #   \"name\":\"#{@character.name}\",
    #   \"status\":\"#{@character.status}\",
    #   \"born\":#{@character.born},
    #   \"species\":\"#{@character.species}\",
    #   \"planet\":\"#{@character.planet}\",
    #   \"occupations\":#{@character.occupations},
    #   \"description\":\"#{@character.description}\",
    #   \"gender\":\"#{@character.gender}\",
    #   \"image\":\"#{haha}\",
    #   \"episode\":#{@character.episode},
    #   \"url\":\"http://localhost:3000/api/character/1\",
    #   \"created_at\":\"#{@character.created_at}\",
    #   \"updated_at\":\"#{@character.updated_at}\"
    #   }"
       
    # show = { "haha": 1, "dede": 2}
    # binding-pry
    render json: show

    # work

    # haha = URI.join(root_url,rails_blob_path(Character.where(id: 1).image.signed_id, only_path: true)).to_s
    #URI.join("http://localhost:3000", rails_blob_path(object.image, only_path: true)).to_s
    # haha = Character.where(id: 1).first.image.signed_id

    # rails_blob_path and 
    # rails_blob_url
    

    
    
    # binding-pry

    # respond_to do |format|
    #   format.any { render :json => {:character => @character, 
    #                                   :episodes => haha }}
    # end

    # work
    # respond_to do |format|
    #   format.any { render :json => {:character => @character, :image => Character.where(id:1).first.image.blob }}
    #   # format.any { render :json => {:character => @character, :episodes => Episode.where(id: 1) }}
    # end

    # @episode = Episode.where(id: 1).first
    # render json: @character.to_json(include: @episode.to_json)
    
    # @character = Character.find(params[:id])
    # @episodes = Episode.all
    # response = { :character => @character, :episodes => @episodes }
    # respond_to do |format|
    #   format.json  { render :json => response }
    # end
    # render json: "{\"id\":1,\"haha\":1,\"name\":\"Michael Burnham\",\"status\":\"Alive\",\"born\":2226,\"species\":\"human\",\"planet\":\"Earth\",\"occupations\":[\"First Officer - USS Shenzhou (2250s–2256)\",\"Science specialist - USS Discovery (2256)\",\"Captain (mirror universe) - USS Discovery\",\"Science officer  - USS Discovery (2257–3189)\",\"Captain (3189-) - USS Discovery\"],\"description\":\"Michael Burnham, Jr. was a female 23rd century Human Starfleet officer raised on Vulcan by Ambassador Sarek and Amanda Grayson following the death of her parents.\",\"gender\":\"female\",\"image\":null,\"episode\":[\"http://localhost:3000/api/episode/1\",\"http://localhost:3000/api/episode/2\",\"http://localhost:3000/api/episode/3\"],\"url\":\"http://localhost:3000/api/character/1\",\"created_at\":\"2021-06-12T17:38:40.855Z\",\"updated_at\":\"2021-06-12T17:38:40.855Z\"}"
    
    
    # render json: @character(include: [:doctor, :patient])
    # render json: @character.to_json(include: [:episode])
    # render json: @character.merge("completion_percentage": 63)
    # render json: @character, (methods: :message) 
    # render json: @character.to_json(include: image)
    # render :json => Character.find(params[:id]) + image
    # render :json => @projects, :include => tasks

    # render json: @character, except: [:image, :id]
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

    # def image
    #   if object.image.present?
    #     URI.join(Rails.application.routes.url_helpers.root_url, rails_blob_path(object.image, only_path: true)).to_s
    #   end
    # end
     
end
