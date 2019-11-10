module Rioter
  class Requester

    def initialize(api_key, region)
      @api_key = api_key
      @region = region
    end

    private

      def base_url
        "https://#{@region}.api.riotgames.com/lol/"
      end

      def make_request(url)
        Typhoeus::Request.new(
          url,
          method: :get,
          headers: {
            "Accept-Charset": "application/x-www-form-urlencoded; charset=UTF-8",
            "Accept-Language" => "en-US,en;q=0.9,pt;q=0.8",
            "X-Riot-Token" => @api_key.to_s,
            "User-Agent": "rioter ruby gem"
          }
        )
      end

      # handling behaviour based on response code
      def check_response!(response)
        case response.code
        when 403

          # TODO: custom errors
          raise StandardError.new("Riot error: Forbidden.")
        else
          JSON.parse(response.body)
        end
      end
  end
end