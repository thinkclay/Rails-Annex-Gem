module Annex
  class Block
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Attributes::Dynamic

    field :route, type: String
    field :content, type: Hash

    validates_presence_of :route
  end
end
