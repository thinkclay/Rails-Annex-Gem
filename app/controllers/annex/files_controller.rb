require_dependency "annex/application_controller"

module Annex
  class FilesController < ApplicationController

    # POST /annex/documents
    def create
      puts 'create called'
    end

  end
end
