require 'annex/view_helpers'

module Annex
  class Railtie < Rails::Railtie
    initializer "annex.view_helpers" do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end