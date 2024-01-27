class SearchController < ApplicationController

    def prompts
        return if prompts_params[:query].empty?
        if prompts_params[:split].present? 
            @prompts = Prompt.search(
                prompts_params[:query], 
                where: {split_id: prompts_params[:split].to_i}
            )
        else
            @prompts = Prompt.search(prompts_params[:query] )
        end

        respond_to do |format|
            format.html 
            format.turbo_stream{}
        end


    end

    private

    def prompts_params 
        params.permit(:query, :split)
    end
end