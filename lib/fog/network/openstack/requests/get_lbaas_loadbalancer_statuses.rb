module Fog
  module Network
    class OpenStack
      class Real
        def get_lbaas_loadbalancer_statuses(loadbalancer_id)
          request(
            :expects => [200],
            :method  => 'GET',
            :path    => "lbaas/loadbalancers/#{loadbalancer_id}/statuses"
          )
        end
      end

      class Mock
        def get_lbaas_loadbalancer_statuses(loadbalancer_id)
          response = Excon::Response.new
          data = {
                    'loadbalancer' =>
                      {
                        'id'                  => loadbalancer_id,
                        'name'                => loadbalancer_id,
                        'operating_status'    => 'ACTIVE',
                        'provisioning_status' => 'ACTIVE',
                        'listeners'           => [],
                        'pools'               => []
                      }
                 }
          response.status = 200
          response.body = {'statuses' => data}
          response
        end
      end
    end
  end
end
