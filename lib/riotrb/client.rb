require "riotrb/v4/third_party_code"
require "riotrb/v4/summoners"

require "typhoeus"

module Riotrb
  class Client

    include Riotrb::V4::Summoners
    include Riotrb::V4::ThirdPartyCode

    attr_accessor :region, :api_key

    def initialize(api_key:, region:)

      # attrs
      @region = region
      @api_key = api_key

      yield(self) if block_given?
    end

    # fixme: namespacing
    def summoners
      self
    end

    # fixme: namespacing
    def third_party_code
      self
    end

    def valid_region?
    end

    def make_request(url)
      Typhoeus::Request.new(
        url,
        method: :get,
        headers: {
          "Accept-Charset": "application/x-www-form-urlencoded; charset=UTF-8",
          "X-Riot-Token": @api_key,
        }
      )
    end
  end
end
