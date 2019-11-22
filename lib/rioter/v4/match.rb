module Rioter
  module V4

    # match object
    class Match
      attr_accessor :lane, :game_id, :champion, :platform_id,
                    :timestamp, :queue, :role, :season

      def initialize(attrs = {})
        @lane = attrs["lane"]
        @game_id = attrs["gameId"]
        @champion = attrs["champion"]
        @platform_id = attrs["platformId"]
        @season = attrs["season"]
        @queue = attrs["queue"]
        @role = attrs["role"]
        @timestamp = attrs["timestamp"]
      end

      def to_h
        {
          lane: @lane,
          game_id: @game_id,
          champion: @champion,
          platform_id: @platform_id,
          season: @season,
          queue: @queue,
          role: @role,
          timestamp: @timestamp
        }
      end
    end
  end
end