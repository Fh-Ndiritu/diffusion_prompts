class SplitController < ApplicationController
  before_action :set_split
  def show
    @prompts = @split.prompts.take(20)
  end


  private

  def set_split
    @split = Split.find(params[:id]) if params[:id]
  end
end
