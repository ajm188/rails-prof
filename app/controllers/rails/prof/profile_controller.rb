require "objspace"
require "stackprof"

module Rails::Prof
  class ProfileController < ApplicationController
    def index
    end

    def cmdline
      response.set_header("X-Content-Type-Options", "nosniff")

      args = ARGV.join("\x00")
      render plain: args, type: "text/plain"
    end

    def cpu
      seconds = params.fetch(:seconds, 10).to_i
      profile = StackProf.run(mode: :cpu, raw: true) do
        sleep seconds
      end

      send_data Marshal.dump(profile), type: "text/plain", filename: "profile"
    end

    def heap
      seconds = params.fetch(:seconds, 10).to_i
      data = ""

      if params.fetch(:gc, 0).to_i > 0
        ObjectSpace.garbage_collect
      end

      ObjectSpace.trace_object_allocations do
        sleep seconds
        data = ObjectSpace.dump_all(output: :string)
      end

      send_data data, type: "application/json", filename: "heap.json"
    end
  end
end
