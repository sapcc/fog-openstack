module Fog
  module Compute
    class OpenStack
      class Real
        # Locks the server.
        #
        # === Parameters
        # * server_id <~String> - The ID of the server to lock.
        # === Returns
        # * success <~Boolean>
        def lock_server(server_id)
          body = {'lock' => nil}
          server_action(server_id, body).status == 202
        end # def lock_server
      end # class Real

      class Mock
        def lock_server(_server_id)
          true
        end # def lock_server
      end # class Mock
    end # class OpenStack
  end # module Compute
end # module Fog
