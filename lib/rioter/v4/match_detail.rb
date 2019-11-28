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

    #match-v4/GET_getMatch - TeamStatsDto
    class TeamStats
      attr_accessor :first_dragon, :first_inhibitor, :bans, :baron_kills,
                    :first_rift_herald, :first_baron, :rift_herald_kills, :first_blood,
                    :team_id, :first_tower, :vilemaw_kills, :inhibitor_kills, :tower_kills,
                    :dominion_victory_score, :win, :dragon_kills, :team_id
      def initialize(attrs = {})
        @first_dragon = attrs["firstDragon"]
        @first_inhibitor = attrs["firstInhibitor"]
        @bans = attrs["bans"]
        @baron_kills = attrs["baronKills"]
        @first_rift_herald = attrs["firstRiftHerald"]
        @first_baron = attrs["firstBaron"]
        @rift_herald_kills = attrs["riftHeraldKills"]
        @first_blood = attrs["firstBlood"]
        @first_tower = attrs["firstTower"]
        @vilemaw_kills = attrs["vilemawKills"]
        @inhibitor_kills = attrs["inhibitorKills"]
        @tower_kills = attrs["towerKills"]
        @dominion_victory_score = attrs["dominionVictoryScore"]
        @win = attrs["win"]
        @team_id = attrs["teamId"]
        @dragon_kills = attrs["dragonKills"]
      end
      def win?
        @win.eql?("Win")
      end
      def lose?
        @win.eql?("Fail")
      end
      def to_h
        {
          first_dragon: @first_dragon,
          first_inhibitor: @first_inhibitor,
          bans: @bans,
          baron_kills: @baron_kills,
          first_rift_herald: @first_rift_herald,
          first_baron: @first_baron,
          rift_herald_kills: @rift_herald_kills,
          first_blood: @first_blood,
          first_tower: @first_tower,
          vilemaw_kills: @vilemaw_kills,
          inhibitor_kills: @inhibitor_kills,
          tower_kills: @tower_kills,
          dominion_victory_score: @dominion_victory_score,
          win: @win,
          team_id: @team_id,
          dragon_kills: @dragon_kills
        }
      end
    end

    # ParticipantDto
    # meant to be instantianted by MatchDetail
    class Participant
      attr_accessor :participant_id, :team_id, :champion_id, :stats,
                    :spell1id, :spell2id
      def initialize(attrs = {}, winning_team_id)
        @participant_id = attrs["participantId"]
        @team_id = attrs["teamId"]
        @champion_id = attrs["championId"]
        @spell1id = attrs["spell1Id"]
        @spell2id = attrs["spell2Id"]
        @stats = ParticipantStats.new(attrs["stats"])

        # convenience attr
        @winning_team_id = winning_team_id
      end

      def won?
        return nil if @winning_team_id.nil?
        @team_id.eql?(@winning_team_id)
      end

      def to_h
        {
          participant_id: @participant_id,
          team_id: @team_id,
          champion_id: @champion_id,
          spell1id: @spell1id,
          spell2id: @spell2id,
          stats: @stats
        }
      end
    end

    # ParticipantStatsDto
    class ParticipantStats
      def initialize(attrs = {})
      end
      def to_h
      end
    end

    #match-v4/GET_getMatch
    class MatchDetail

      attr_accessor :season_id, :queue_id, :game_id, :participant_identities,
                    :game_version, :platform_id, :game_mode, :map_id,
                    :game_type, :teams, :game_duration, :game_creation,
                    :participants

      def initialize(attrs = {})
        @game_id = attrs["gameId"]
        @game_mode = attrs["gameMode"]
        @season_id = attrs["seasonId"]
        @queue_id = attrs["queueId"]
        @platform_id = attrs["platformId"]
        @game_version = attrs["gameVersion"]
        @map_id = attrs["mapId"]
        @game_type = attrs["gameType"]
        @game_duration = attrs["gameDuration"]
        @game_creation = attrs["gameCreation"]

        # PlayerDto
        @participant_identities = []
        attrs["participantIdentities"].each do |p|
          @participant_identities << ParticipantIdentity.new(p)
        end

        # ParticipantDto
        @teams = []
        attrs["teams"].each do |t|
          @teams << TeamStats.new(t)
        end

        # ParticipantDto
        @participants = []
        attrs["participants"].each do |t|
          @participants << Participant.new(t, winning_team.team_id)
        end
      end

      def losing_team
        @teams.find do |t|
          t.lose?
        end
      end

      def winning_team
        @teams.find do |t|
          t.win?
        end
      end

      def to_h
        {
          game_id: @game_id,
          game_mode: @game_mode,
          season_id: @season_id,
          queue_id: @queue_id,
          platform_id: @platform_id,
          game_version: @game_version,
          game_type: @game_type,
          game_duration: @game_duration,
          game_creation: @game_creation,
          participant_identities: @participant_identities,
          teams: @teams,
          participants: @participants
        }
      end
    end
  end
end