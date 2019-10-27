module Riotrb
  module V4
    module ThirdPartyCode

      def by_summoner(encrypted_summoner_id:)

        url = "https://#{@region}.api.riotgames.com/lol/platform/v4/third-party-code/by-summoner/#{encrypted_summoner_id}"

        req = make_request(url)
        res = req.run
        res.body
      end
    end
  end
end
