Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/home", to: "static_pages#home"
    get "/new", to: "users#new"
    root "static_pages#home"
  end
end
