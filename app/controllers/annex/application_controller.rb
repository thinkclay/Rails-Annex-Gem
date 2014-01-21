module Annex

  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :null_session

    before_filter :annex_authenticate!
    before_filter :annex_authorize!

    def annex_authenticate!
      instance_eval &Annex::Config.authenticate_with
    end

    def annex_authorize!
      instance_eval &Annex::Config.authorize_with
    end
  end

end