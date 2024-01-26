class SplitController < ApplicationController
  before_action :set_split
  def show
    @pagy, @prompts = pagy(@split.prompts)
  end


  private

  def set_split
    @split = Split.find(params[:id]) if params[:id]
  end
end
