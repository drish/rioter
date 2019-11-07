require "rioter/requester"

module Rioter
  module V4
    class ThirdPartyCode < Rioter::Requester

      def initialize(api_key, region)
        super(api_key, region)
      end

      def base_url
        "https://#{@region}.api.riotgames.com/lol/platform/v4/"
      end

      def by_summoner(encrypted_summoner_id:)
        url = "#{base_url}third-party-code/by-summoner/#{encrypted_summoner_id}".to_s
        req = make_request(url)
        res = req.run
        res.body
      end
    end
  end
end
