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
      def initialize(e)
        @retry_after = e[:retry_after]
        @msg = e[:msg]
        super(@msg)
      end
    end
  end
end