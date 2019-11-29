module Rioter
  module Errors
    class SummonerNotFound < StandardError
      def initialize(summoner_name = "")
        msg = summoner_name.eql?("") ? "Summoner not found." : "#{summoner_name} not found."
        super(msg)
      end
    end
    class RateLimited < StandardError
      attr_accessor :retry_after
      def initialize(msg, retry_after)
        @retry_after = retry_after
        super
      end
    end
  end
end