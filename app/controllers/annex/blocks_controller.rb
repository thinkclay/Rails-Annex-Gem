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

      respond_to do |format|
        if @block.save
          format.json { render json: {status: :success}, status: :ok }
        else
          format.json { render json: @block.errors, status: :unprocessable_entity }
        end
      end
    end

  end
end
