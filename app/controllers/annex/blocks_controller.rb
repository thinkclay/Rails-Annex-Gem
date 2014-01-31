require_dependency "annex/application_controller"

module Annex
  class BlocksController < ApplicationController

    # POST /annex/blocks
    def create
      @block = Block.where(:route => params[:route]).first_or_create
      @block.content ||= {}

      params[:content].keys.each do |key|
        @block.content[key] = params[:content][key]
      end

      if @block.save
        render json: {status: :success}, status: :ok
      else
        render json: @block.errors, status: :unprocessable_entity
      end
    end

    private

      def block_params
        params.require(:user).permit(:route, :content)
      end
  end
end
