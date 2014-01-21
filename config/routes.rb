Rails.application.routes.draw do
  namespace :annex do
    resources :blocks, :only => [:create], :defaults => { :format => 'json' }
  end
end