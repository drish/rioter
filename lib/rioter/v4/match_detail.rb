require "rioter/v4/player_detail"

module Rioter
  module V4

    #match-v4/GET_getMatch - ParticipantIdentityDto
    class ParticipantIdentity
      attr_accessor :player, :participantId
      def initialize(attrs = {})
        @player = PlayerDetail.new(attrs["player"])
        @participant_id = attrs["participantId"]
      end
      def to_h
        {
          player: @player,
          participant_id: @participant_id
        }
      end
    end

    #match-v4/GET_getMatch
    class MatchDetail

      # TODO: add rest of attributes
      attr_accessor :season_id, :queueId, :gameId, :participant_identities,
                    :game_version, :platform_id, :game_mode, :map_id
                    :game_type

      def initialize(attrs = {})
        @season_id = attrs["seasonId"]
        @queue_id = attrs["queueId"]

        # PlayerDto
        @participant_identities = []
        attrs["participantIdentities"].each do |p|
          @participant_identities << ParticipantIdentity.new(p)
        end
      end

      def to_h
        {
          season_id: @season_id,
          queue_id: @queue_id,
          participant_identities: @participant_identities
        }
      end
    end
  end
end