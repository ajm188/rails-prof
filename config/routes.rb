Rails::Prof::Engine.routes.draw do
    root to: "profile#index"

    get "/heap", to: "profile#heap"
end
