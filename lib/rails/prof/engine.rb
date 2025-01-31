module Rails
  module Prof
    class Engine < ::Rails::Engine
      isolate_namespace Rails::Prof
    end
  end
end
