module Riotrb
  class Requester

    def initialize(api_key, region)
      @api_key = api_key
      @region = region
    end

    private

      def base_url
        "https://#{@region}.api.riotgames.com/lol/summoner/v4/"
      end

      def make_request(url)
        Typhoeus::Request.new(
          url + "?api_key=#{@api_key}",
          method: :get,
          headers: {
            "Accept-Charset": "application/x-www-form-urlencoded; charset=UTF-8",
            "Accept-Language" => "en-US,en;q=0.9,pt;q=0.8",
            "X-Riot-Token" => @api_key.to_s,
            "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.70 Safari/537.36"
          }
        )
      end
  end
end