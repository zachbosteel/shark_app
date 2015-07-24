Rails.application.routes.draw do
  get "/" => 'sharks#index'

  namespace :v1 do
    root to: 'sharks#index'
    get "/" => 'sharks#index'
    get "/sharks" => 'sharks#index'
    get "/sharks/:id" => 'sharks#show'
    post "/sharks" => 'sharks#create'
    patch "/sharks/:id" => 'sharks#update'
    delete "/sharks/:id" => 'sharks#destroy'
  end

  namespace :v2 do
    root to: 'sharks#index'
    get "/" => 'sharks#index'
    get "/sharks" => 'sharks#index'
    get "/sharks/:id" => 'sharks#show'
    post "/sharks" => 'sharks#create'
    patch "/sharks/:id" => 'sharks#update'
    delete "/sharks/:id" => 'sharks#destroy'
  end

end
