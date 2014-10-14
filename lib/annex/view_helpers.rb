require 'active_support/hash_with_indifferent_access'

module Annex
  #
  # Create global view helpers
  #
  module ViewHelpers
    #
    # annex_block is a universal helper to render content from
    # mongodb and display it on the page
    #
    # @TODO: implement caching
    #
    def annex_block(identifier, opts = {})
      opts[:route] ||= current_route

      doc = Annex::Block.where(route: opts[:route]).first_or_create

      content = doc.content.try(:[], identifier.to_s) || opts[:default]

      render partial: 'annex/block', locals: { content: content, identifier: identifier, opts: opts }
    end

    def current_route
      "#{I18n.locale}_#{params[:controller]}_#{params[:action]}".to_sym
    end
  end
end
