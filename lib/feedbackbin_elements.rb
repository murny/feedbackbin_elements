require "feedbackbin_elements/version"
require "feedbackbin_elements/engine"

module FeedbackbinElements
  mattr_accessor :importmap, default: Importmap::Map.new
end
