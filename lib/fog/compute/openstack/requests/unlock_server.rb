module Fog
  module Compute
    class OpenStack
      class Real
        # Unlocks the server.
        #
        # === Parameters
        # * server_id <~String> - The ID of the server to unlock.
        # === Returns
        # * success <~Boolean>
        def unlock_server(server_id)
          body = {'unlock' => nil}
          server_action(server_id, body).status == 202
        end # def unlock_server
      end # class Real

      class Mock
        def unlock_server(_server_id)
          true
        end # def unlock_server
      end # class Mock
    end # class OpenStack
  end # module Compute
end # module Fog
