require_dependency "annex/application_controller"

module Annex
  class BlocksController < ApplicationController
    before_action :set_block, only: [:show, :edit, :update, :destroy]

    # GET /blocks
    def index
      @blocks = Block.all

      respond_to do |format|
        format.json { render json: @blocks }
      end
    end

    # GET /blocks/1
    def show
      respond_to do |format|
        format.json { render json: @blocks }
      end
    end

    # GET /blocks/new
    def new
      @block = Block.new
    end

    # GET /blocks/1/edit
    def edit
    end

    # POST /annex/blocks
    #
    # $.ajax({
    #   url: '/annex/blocks',
    #   contentType: 'application/json',
    #   dataType: 'json',
    #   data: '{"route" : "test.route"}',
    #   type: 'POST'
    # });
    def create
      @block = Block.new(block_params)

      respond_to do |format|
        if @block.save
          format.json { render json: @blocks, status: :created }
        else
          format.json { render json: @blocks.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /blocks/1
    def update
      respond_to do |format|
        if @block.update(block_params)
          format.json { render json: @blocks, status: :updated }
        else
          format.json { render json: @blocks.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /blocks/1
    def destroy
      respond_to do |format|
        if @block.destroy
          format.json { head :no_content, status: :ok }
        else
          format.json { render json: @blocks.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_block
        @block = Block.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def block_params
        params.require(:block).permit(:route, :content)
      end
  end
end
