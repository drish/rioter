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
        url = "#{base_url}summoner/v4/summoners/by-name/#{name}"
        req = make_request(url)
        res = req.run
        parsed = check_response!(res)
        Rioter::V4::Summoner.new(parsed)
      end
    end
  end
end
