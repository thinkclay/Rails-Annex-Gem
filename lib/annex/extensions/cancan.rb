require 'annex/extensions/cancan/authorization_adapter'

Annex.add_extension(:cancan, Annex::Extensions::CanCan, {
  :authorization => true
})
