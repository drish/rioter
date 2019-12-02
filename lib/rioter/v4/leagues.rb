require "rioter/requester"
require "rioter/v4/league_entry"

module Rioter
  module V4
    class Leagues < Rioter::Requester

      def initialize(api_key, region)
        super(api_key, region)
      end

      # GET_getLeagueEntries
      def by_queue_tier_division(queue:, tier:, division:, page:)
        url = "#{base_url}league/v4/entries/#{queue}/#{tier}/#{division}?page=#{page}"
        entries = make_request(url)
        entries.map { |entry| Rioter::V4::LeagueEntry.new(entry) }
      end

      # GET_getChallengerLeague
      def by_challenger_league(queue:)
        url = "#{base_url}league/v4/challengerleagues/by-queue/#{queue}"
        entries = make_request(url)
        entries["entries"].map do |entry|
          Rioter::V4::LeagueEntry.new(entry.merge({ "tier" => "CHALLENGER", "leagueId" => entries["leagueId"] }))
        end
      end

      # GET_getGrandMasterLeague
      def by_grandmaster_league(queue:)
        url = "#{base_url}league/v4/grandmasterleagues/by-queue/#{queue}"
        entries = make_request(url)
        entries["entries"].map do |entry|
          Rioter::V4::LeagueEntry.new(entry.merge({ "tier" => "GRANDMASTER", "leagueId" => entries["leagueId"] }))
        end
      end

      # GET_getMasterLeague
      def by_master_league(queue:)
        url = "#{base_url}league/v4/masterleagues/by-queue/#{queue}"
        entries = make_request(url)
        entries["entries"].map do |entry|
          Rioter::V4::LeagueEntry.new(entry.merge({ "tier" => "MASTER", "leagueId" => entries["leagueId"] }))
        end
      end

      # GET_getLeagueById
      def by_league_id(league_id:)
        url = "#{base_url}league/v4/leagues/#{league_id}"
        entries = make_request(url)
        entries["entries"].map do |entry|
          Rioter::V4::LeagueEntry.new(entry.merge({ "tier" => entries["tier"], "leagueId" => entries["leagueId"] }))
        end
      end

      # GET_getLeagueEntriesForSummoner
      def by_summoner(encrypted_summoner_id:)
        url = "#{base_url}league/v4/entries/by-summoner/#{encrypted_summoner_id}"
        entries = make_request(url)
        entries.map { |entry| Rioter::V4::LeagueEntry.new(entry) }
      end

      private

        def validate_queue(q)
          [
            "RANKED_SOLO_5x5",
            "RANKED_TFT",
            "RANKED_FLEX_SR",
            "RANKED_FLEX_TT"
          ].include?(q)
        end

        def validate_tier(t)
          [
            "DIAMOND",
            "PLATINUM",
            "GOLD",
            "SILVER",
            "BRONZE",
            "IRON"
          ].include?(d)
        end

        def validate_division(d)
          ["I", "II", "III", "IV"].include?(d)
        end
    end
  end
end
