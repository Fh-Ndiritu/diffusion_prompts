class SearchController < ApplicationController
    before_action :set_split
    def prompts
        
        if prompts_params[:query].empty?
            @pagy, @prompts = pagy(Prompt.all)
        elsif @current_split
           @pagy, @prompts = pagy(Prompt.search(
                prompts_params[:query], 
                where: {split_id: @current_split.id}
            ))
        else
            @pagy, @prompts = pagy(Prompt.search(prompts_params[:query] ))
        end

        respond_to do |format|
           format.html 
           format.turbo_stream 
        end


    end

    private

    def set_split
        return if params[:split]&.empty?
        @current_split = Split.find(params[:split])
    end

    def prompts_params 
        params.permit(:query)
    end
end