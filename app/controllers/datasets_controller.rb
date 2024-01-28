class DatasetsController < ApplicationController
  before_action :set_dataset


  def show
    @pagy, @prompts = pagy(@dataset.prompts)
    @splits = @dataset.splits.pluck(:name, :id)
  end

  def index 
    @pagy, @dataset = pagy(Dataset.all)
  end



  private 

  def set_dataset
    if params[:id]
      @dataset = Dataset.find(params[:id])
    end
  end
end
