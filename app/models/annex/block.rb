module Annex
  #
  # Block Model
  #
  # Stores the raw information in the database
  #
  class Block
    include Mongoid::Document
    include Mongoid::Timestamps
    include Mongoid::Attributes::Dynamic

    field :route, type: String
    field :content, type: Hash

    validates_presence_of :route
  end
end
