module Rails
  module Prof
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
