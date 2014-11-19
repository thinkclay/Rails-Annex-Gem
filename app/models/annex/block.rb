#
# Block Model
#
# Stores the raw information in the database
#
module Annex

  case Annex::config[:adapter]

  when :activerecord
    class Block < ActiveRecord::Base
      validates_presence_of :route

      def self.builder(params)
        block = Block.where(route: "#{params[:route]}_#{params[:identifier]}").first_or_create
        block.content = params[:content][params[:identifier].to_sym]

        return block
      end
    end

  when :mongoid
    class Block
      include Mongoid::Document
      include Mongoid::Timestamps
      include Mongoid::Attributes::Dynamic

      field :route, type: String
      field :content, type: Hash

      validates_presence_of :route

      def self.builder(params)
        block = Block.where(route: params[:route]).first_or_create

        block.content ||= {}

        params[:content].keys.each do |key|
          block.content[key] = params[:content][key]
        end

        return block
      end
    end
  end

end
