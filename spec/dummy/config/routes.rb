Rails.application.routes.draw do
  mount Shikigami::Engine => "/shikigami"
  resources :books
end
