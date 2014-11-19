require_dependency "annex/application_controller"

module Annex
  class BlocksController < ApplicationController

    # POST /annex/blocks
    def create
      @block = Block.builder(params)

      if @block.save
        render json: { status: :success }, status: :ok
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
