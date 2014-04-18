require 'active_support/hash_with_indifferent_access'

module Annex
  module ViewHelpers
    def annex_block(identifier, opts = {})
      opts[:default] ||= ''

      if opts.try(:route)
        route = opts[:route]
        opts[:route].delete
      else
        route = current_route
      end

      doc = Annex::Block.where(:route => route.to_s).first_or_create

      if doc.content
        content = doc.content[identifier.to_s] || opts[:default]
      else
        content = opts[:default]
      end

      render partial: 'annex/block', locals: { content: content, route: route, identifier: identifier, opts: opts }
    end

    def annex_clips(clip)
      render partial: 'annex/clips'
    end

    def current_route
      "#{I18n.locale}_#{params[:controller]}_#{params[:action]}".to_sym
    end
  end
end
