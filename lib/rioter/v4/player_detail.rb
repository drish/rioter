module Rioter
  module V4

    #match-v4/GET_getMatch - PlayerDto
    class PlayerDetail
      attr_accessor :current_platform_id, :summoner_name, :match_history_url, :platform_id,
                    :current_account_id, :profile_icon, :summoner_id, :account_id

      def initialize(attrs = {})
        @profile_icon = attrs["profileIcon"]
        @summoner_name = attrs["summonerName"]
        @match_history_url = attrs["matchHistoryUrl"]
        @platform_id = attrs["platformId"]
        @current_account_id = attrs["currentAccountId"]
        @current_platform_id = attrs["currentPlatformId"]
        @summoner_id = attrs["summonerId"]
        @account_id = attrs["accountId"]
      end

      def to_h
        {
          profile_icon: @profile_icon,
          summoner_name: @summoner_name,
          match_history_url: @match_history_url,
          platform_id: @platform_id,
          current_account_id: @current_account_id,
          current_platform_id: @current_platform_id,
          account_id: @account_id,
          summoner_id: @summoner_id
        }
      end
    end
  end
end