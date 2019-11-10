require "rioter/requester"
require "rioter/v4/league_entry"

module Rioter
  module V4
    class Leagues < Rioter::Requester

      def initialize(api_key, region)
        super(api_key, region)
      end

      def by_summoner(encrypted_summoner_id:)
        url = "#{base_url}league/v4/entries/by-summoner/#{encrypted_summoner_id}"
        req = make_request(url)
        res = req.run
        parsed = check_response!(res)
        parsed.map {|league_entry| Rioter::V4::LeagueEntry.new(league_entry)}
      end
    end
  end
end
