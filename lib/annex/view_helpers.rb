module Annex
  module ViewHelpers
    def annex_block(route, identifier, opts = {})
      doc = Annex::Block.where(:route => route.to_s).first
      content = doc[:content][identifier.to_s]

      render partial: 'annex/block', locals: { content: content, route: route, identifier: identifier, opts: opts }
    end

    def current_route
      "#{params[:controller]}_#{params[:action]}".to_sym
    end
  end
end