require "riotrb/v4/third_party_code"
require "riotrb/v4/summoners"

module Riotrb
  class Client

    attr_accessor :region, :summoners, 
                  :third_party_code, :matches, :maestries

    def initialize(api_key:, region:)
      raise StandardError.new("invalid arguments") if blank?(api_key) or blank?(region) 
      @region = region

      @summoners = Riotrb::V4::Summoners.new(api_key, region)
      @third_party_code = Riotrb::V4::ThirdPartyCode.new(api_key, region)
    end

    def blank?(val)
      val.respond_to?(:empty?) ? val.empty? : !val
    end

    def valid_region?
      Riotrb::REGIONS.include?(@region)
    end
  end
end
