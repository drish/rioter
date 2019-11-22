module Rioter
  module V4

    # summoner object
    class Summoner
      attr_accessor :name, :profile_icon_id, :puuid,
                    :summoner_level, :account_id, :revision_date,
                    :id

      def initialize(attrs = {})
        @profile_icon_id = attrs["profileIconId"]
        @name = attrs["name"]
        @puuid = attrs["puuid"]
        @summoner_level = attrs["summonerLevel"]
        @account_id = attrs["accountId"]
        @id = attrs["id"]
        @revision_date = attrs["revisionDate"]
      end

      def to_h
        {
          profile_icon_id: @profile_icon_id,
          name: @name,
          puuid: @puuid,
          summoner_level: @summoner_level,
          account_id: @account_id,
          id: @id,
          revision_date: @revision_date
        }
      end
    end
  end
end