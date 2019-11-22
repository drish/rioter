require "rioter/requester"
require "rioter/v4/match_list"
require "rioter/v4/match_detail"

module Rioter
  module V4
    class Matches < Rioter::Requester

      def initialize(api_key, region)
        super(api_key, region)
      end

      def by_match(match_id:)
        url = "#{base_url}match/v4/matches/#{match_id}"
        match_detail = make_request(url)
        MatchDetail.new(match_detail)
      end

      def by_account(encrypted_account_id:)
        url = "#{base_url}match/v4/matchlists/by-account/#{encrypted_account_id}"
        matches = make_request(url)
        MatchList.new(matches)
      end
    end
  end
end
