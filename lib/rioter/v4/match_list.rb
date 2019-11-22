require 'rioter/v4/match'

module Rioter
  module V4

    # list matches response
    class MatchList
      attr_accessor :matches, :total_games, :start_index,
                    :end_index

      def initialize(attrs = {})

        @matches = []
        attrs["matches"].each do |m|
          @matches << Match.new(m)
        end

        @total_games = attrs["totalGames"]
        @start_index = attrs["startIndex"]
        @end_index = attrs["endIndex"]
      end

      def to_h
        {
          matches: @matches,
          total_games: @total_games,
          start_index: @start_index,
          end_index: @end_index
        }
      end
    end
  end
end