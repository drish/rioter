require "rioter/v4/third_party_code"
require "rioter/v4/summoners"
require "rioter/v4/leagues"

module Rioter
  class Client

    attr_accessor :region, :summoners, :leagues,
                  :third_party_code, :matches, :maestries

    def initialize(api_key:, region:)
      raise StandardError.new("invalid arguments") if blank?(api_key) or blank?(region)
      @region = region

      @summoners = Rioter::V4::Summoners.new(api_key, region)
      @third_party_code = Rioter::V4::ThirdPartyCode.new(api_key, region)
      @leagues = Rioter::V4::Leagues.new(api_key, region)
    end

    def blank?(val)
      val.respond_to?(:empty?) ? val.empty? : !val
    end

    def valid_region?
      Rioter::REGIONS.include?(@region)
    end
  end
end
