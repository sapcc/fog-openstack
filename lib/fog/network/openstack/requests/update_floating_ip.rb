module Fog
  module Network
    class OpenStack
      class Real
        def update_floating_ip(floating_ip_id, port_id, options = {})
          data = {
            'floatingip' => {
              'port_id' => port_id,
            }
          }

          vanilla_options = [:fixed_ip_address, :description]
          vanilla_options.select { |o| options.key?(o) }.each do |key|
            data['floatingip'][key] = options[key]
          end

          request(
            :body    => Fog::JSON.encode(data),
            :expects => 200,
            :method  => 'PUT',
            :path    => "floatingips/#{floating_ip_id}"
          )
        end
      end

      class Mock
        def update_floating_ip(floating_ip_id, port_id, options = {})
          response = Excon::Response.new
          floating_ip = list_floating_ips.body['floatingips'].find { |fip| fip['id'] == floating_ip_id }
          if floating_ip
            floating_ip['port_id']          = port_id
            floating_ip['fixed_ip_address'] = options[:fixed_ip_address]
            floating_ip['description']      = options[:description]
            response.body = {'floatingip' => floating_ip}
            response.status = 200
            response
          else
            raise Fog::Network::OpenStack::NotFound
          end
        end
      end
    end
  end
end
