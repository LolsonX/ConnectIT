class Ver1::TagsController < ApplicationController
  before_action :set_ver1_tag, only: [:show, :update, :destroy]

  # GET /ver1/tags
  # GET /ver1/tags.json
  def index
    @ver1_tags = Ver1::Tag.all
  end

  # GET /ver1/tags/1
  # GET /ver1/tags/1.json
  def show
  end

  # POST /ver1/tags
  # POST /ver1/tags.json
  def create
    @ver1_tag = Ver1::Tag.new(ver1_tag_params)

    if @ver1_tag.save
      render :show, status: :created, location: @ver1_tag
    else
      render json: @ver1_tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ver1/tags/1
  # PATCH/PUT /ver1/tags/1.json
  def update
    if @ver1_tag.update(ver1_tag_params)
      render :show, status: :ok, location: @ver1_tag
    else
      render json: @ver1_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ver1/tags/1
  # DELETE /ver1/tags/1.json
  def destroy
    @ver1_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ver1_tag
      @ver1_tag = Ver1::Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ver1_tag_params
      params.require(:ver1_tag).permit(:name)
    end
end
