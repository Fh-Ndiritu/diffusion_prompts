class PromptsController < ApplicationController

  # GET /prompts or /prompts.json
  def index
    @pagy, @prompts = pagy(Prompt.all)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prompt
      @prompt = Prompt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prompt_params
      params.require(:prompt).permit(:split_id, :row_idx, :content)
    end
end
