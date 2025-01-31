require "objspace"

module Rails::Prof
  class ProfileController < ApplicationController
    def index
    end

    def heap
      seconds = params.fetch(:seconds, 10)
      data = ""

      ObjectSpace.trace_object_allocations do
        sleep seconds
        data = ObjectSpace.dump_all(output: :string)
      end

      send_data data, type: "application/json", filename: "heap.json"
    end
  end
end
