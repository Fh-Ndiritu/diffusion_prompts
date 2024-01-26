class DatasetController < ApplicationController
  before_action :set_dataset
  def show
    @pagy, @prompts = pagy(@dataset.prompts)
  end



  private 

  def set_dataset
    if params[:id]
      @dataset = Dataset.find(params[:id])
    end
  end
end
