module Annex
  #
  # Create global view helpers
  #
  module ViewHelpers
    #
    # annex_block is a universal helper to render content from
    # the database and display it on the page
    #
    def annex_block(identifier, opts = {})
      opts[:route] ||= current_route

      case Annex::config[:adapter]

      when :activerecord
        doc = Annex::Block.where(route: "#{opts[:route]}_#{identifier}").first_or_create
        content = doc.content

      when :mongoid
        doc = Annex::Block.where(route: opts[:route]).first_or_create
        content = doc.content.try(:[], identifier.to_s)

      end

      render partial: 'annex/block', locals: { content: content || opts[:default], identifier: identifier, opts: opts }
    end

    def current_route
      "#{I18n.locale}_#{params[:controller]}_#{params[:action]}".to_sym
    end
  end
end
