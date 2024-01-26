class DatasetController < ApplicationController
  before_action :set_dataset
  def show
    @prompts = @dataset.prompts.take(20)
  end



  private 

  def set_dataset
    if params[:id]
      @dataset = Dataset.find(params[:id])
    end
  end
end
