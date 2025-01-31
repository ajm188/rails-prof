Rails::Prof::Engine.routes.draw do
    root to: "profile#index"

    get "/cpu", to: "profile#cpu"
    get "/heap", to: "profile#heap"
end
