class SearchController < ApplicationController
    before_action :set_split
    def prompts
        
        if prompts_params[:query].empty?
            @pagy, @prompts = pagy(Prompt.all)
        else   
            collection = @current_split ?  
            Prompt.pagy_search(prompts_params[:query], where: {split_id: @current_split.id})
            : Prompt.pagy_search(prompts_params[:query])
            
            @pagy, @prompts = pagy_searchkick(collection)
        end


        respond_to do |format|
           format.html 
           format.turbo_stream 
        end


    end

    private

    def set_split
        if params[:split].present?
            @current_split = Split.find(params[:split])
        end
    end

    def prompts_params 
        params.permit(:query)
    end
end