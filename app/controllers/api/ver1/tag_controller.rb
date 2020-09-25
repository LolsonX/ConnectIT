class Api::Ver1::TagController < ApplicationController
  before_action :set_tag, only: [:show, :destroy]
  def index
  end

  def create
  end

  def show
  end

  def destroy
  end

  private

  def create_tag_params
    params.require(:tag).permit(:id, :name)
  end

  def set_tag
    @tag = Tag.find(create_tag_params[:id])
  end
end
