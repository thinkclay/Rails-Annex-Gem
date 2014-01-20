Rails.application.routes.draw do
  namespace :annex do
    resources :blocks, :defaults => { :format => 'json' }
  end
end