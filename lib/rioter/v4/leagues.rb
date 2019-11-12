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
        entries = make_request(url)
        entries.map { |entry| Rioter::V4::LeagueEntry.new(entry) }
      end
    end
  end
end
