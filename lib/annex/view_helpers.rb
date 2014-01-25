require 'active_support/hash_with_indifferent_access'

module Annex
  module ViewHelpers
    def annex_block(identifier, opts = {})
      if opts.try(:route)
        route = opts[:route]
        opts[:route].delete
      else
        route = current_route
      end

      doc = Annex::Block.where(:route => route.to_s).first_or_create

      if doc.try(:content)
        content = doc[:content][identifier.to_s] || ''
      else
        content = ''
      end

      render partial: 'annex/block', locals: { content: content, route: route, identifier: identifier, opts: opts }
    end

    def current_route
      "#{params[:controller]}_#{params[:action]}".to_sym
    end
  end
end