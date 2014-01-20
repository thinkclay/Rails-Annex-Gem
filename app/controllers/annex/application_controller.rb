module Annex

  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :null_session

    before_filter :_authenticate!
    before_filter :_authorize!

    def _authenticate!
      instance_eval &Annex::Config.authenticate_with
    end

    def _authorize!
      instance_eval &Annex::Config.authorize_with
    end
  end

end