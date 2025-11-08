Rails.application.routes.draw do
  mount FeedbackbinElements::Engine => "/feedbackbin_elements"
  mount Showcase::Engine, at: "/showcase" if defined?(Showcase::Engine)
end
