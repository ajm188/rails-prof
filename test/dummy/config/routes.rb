Rails.application.routes.draw do
  mount Rails::Prof::Engine => "/pprof"
end
