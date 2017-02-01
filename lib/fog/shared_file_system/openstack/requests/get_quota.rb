module Fog
  module SharedFileSystem
    class OpenStack
      class Real
        def get_quota(project_id)
          request(
            :expects => 200,
            :method  => 'GET',
            :path    => "#{action_prefix}quota-sets/#{project_id}"
          )
        end
      end

      class Mock
        def get_quota(_project_id = nil)
          response = Excon::Response.new
          response.status = 200
          response.body = {'quota_set' => data[:quota_updated] || data[:quota]}
          response
        end
      end
    end
  end
end
