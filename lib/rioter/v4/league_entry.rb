module Rioter
  module V4

    # league entry object
    class LeagueEntry
      attr_accessor :queue_type, :summoner_name, :hot_streak, :mini_series,
                    :wins, :veteran, :losses, :rank, :league_id, :inactive,
                    :fresh_blood, :tier, :summoner_id, :league_points

      def initialize(attrs = {})
        @queue_type = attrs["queueType"]
        @summoner_name = attrs["summonerName"]
        @hot_streak = attrs["hotStreak"]
        @mini_series = attrs["miniSeries"]
        @wins = attrs["wins"]
        @veteran = attrs["veteran"]
        @losses = attrs["losses"]
        @rank = attrs["rank"]
        @tier = attrs["tier"]
        @inactive = attrs["inactive"]
        @fresh_blood = attrs["freshBlood"]
        @league_id = attrs["leagueId"]
        @summoner_id = attrs["summonerId"]
        @league_points = attrs["leaguePoints"]
      end

      def to_h
        {
          queue_type: @queue_type,
          summoner_name: @summoner_name,
          hot_streak: @hot_streak,
          mini_series: @mini_series,
          wins: @wins,
          veteran: @veteran,
          losses: @losses,
          rank: @rank,
          tier: @tier,
          inactive: @inactive,
          fresh_blood: @fresh_blood,
          summoner_id: @summoner_id,
          league_id: @league_id,
          league_points: @league_points
        }
      end

      def mini_series?
        !@mini_series.nil?
      end

      def flex?
        @queue_type.eql?("RANKED_FLEX_SR")
      end

      def ranked_solo?
        @queue_type.eql?("RANKED_SOLO_5x5")
      end

      def ranked_tft?
        @queue_type.eql?("RANKED_TFT")
      end
    end
  end
end