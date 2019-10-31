require "riotrb/requester"

module Riotrb
  module V4
    class Summoners < Riotrb::Requester

      def initialize(api_key, region)
        super(api_key, region)
      end

      def by_account
        "#{self.class.name} by_account #{@region}"
      end

      def by_name(name:)
        url = "#{base_url}summoners/by-name/#{name}"
        req = make_request(url)
        res = req.run
        res.body
      end
    end
  end
end
