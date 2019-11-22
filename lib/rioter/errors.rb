module Rioter
  module Errors
    class SummonerNotFound < StandardError
      def initialize(summoner_name = "")
        msg = summoner_name.eql?("") ? "Summoner not found." : "#{summoner_name} not found."
        super(msg)
      end
    end
  end
end