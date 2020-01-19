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

      def by_account(encrypted_account_id, opts)
        url = "#{base_url}match/v4/matchlists/by-account/#{encrypted_account_id}"

        # TODO: move to helpers
        if opts
          url = url + "?"
          query_string = []
          opts.each do |k, v|
           query_string << "endIndex=#{v}" and next if k.eql?(:end_index)
           query_string << "beginIndex=#{v}" and next if k.eql?(:begin_index)
           query_string << "beginTime=#{v}" and next if k.eql?(:begin_time)
           query_string << "#{k}=#{v}"
          end
          url = url + query_string.join("&")
        end

        matches = make_request(url)
        MatchList.new(matches)
      end
    end
  end
end
