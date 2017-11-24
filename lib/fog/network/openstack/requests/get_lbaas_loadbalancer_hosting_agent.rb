module Fog
  module Network
    class OpenStack
      class Real
        def get_lbaas_loadbalancer_hosting_agent(loadbalancer_id)
          request(
            :expects => [200],
            :method  => 'GET',
            :path    => "lbaas/loadbalancers/#{loadbalancer_id}/loadbalancer-hosting-agent"
          )
        end
      end

      class Mock
        def get_lbaas_loadbalancer_hosting_agent(loadbalancer_id)
          response = Excon::Response.new
          response.status = 200
          response.body = {'agent' => {'host' => 'testhost'}}
          return response
        end
      end
    end
  end
end
