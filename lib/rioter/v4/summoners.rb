require "rioter/requester"
require "rioter/v4/summoner"
require "json"

module Rioter
  module V4
    class Summoners < Rioter::Requester

      def initialize(api_key, region)
        super(api_key, region)
      end

      def by_account
        "#{self.class.name} by_account #{@region}"
      end

      def by_name(name:)
        encoded = URI.escape(name)
        url = "#{base_url}summoner/v4/summoners/by-name/#{encoded}"
        summoner_data = make_request(url)
        Rioter::V4::Summoner.new(summoner_data)
      end
    end
  end
end
