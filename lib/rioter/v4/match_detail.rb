require "rioter/v4/player_detail"
require "rioter/helpers"

module Rioter
  module V4

    #match-v4/GET_getMatch - ParticipantIdentityDto
    class ParticipantIdentity
      attr_accessor :player, :participant_id
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
      attr_accessor :first_blood_assist, :vision_score, :magic_damage_dealt_to_champions,
                    :damage_dealt_to_objectives, :total_time_crowd_control_dealt,
                    :longest_time_spent_living, :perk1var1, :perk1var2, :perk1var3,
                    :triple_kills, :perk3var3, :node_neutralize_assist, :perk3var2, :player_score_0,
                    :player_score_1, :player_score_2, :player_score_3, :player_score_4,
                    :player_score_5, :player_score_6, :player_score_7, :player_score_8,
                    :player_score_9, :kills, :perk5var1, :perk5var2, :perk5var3, :total_score_rank,
                    :neutral_minions_killed, :damage_dealt_to_turrets, :physical_damage_dealt_to_champions,
                    :node_capture, :largest_multi_kill, :perk2var1, :perk2var2, :perk2var3, :total_units_healed,
                    :perk4var1, :perk4var2, :perk4var3, :wards_killed, :largest_critical_strike,
                    :largest_killing_spree, :quadra_kills, :team_objective, :magic_damage_dealt,
                    :item0, :item1, :item2, :item3, :item4, :item5, :item6, :neutral_minions_killed_team_jungle,
                    :perk1, :perk2, :perk3, :perk4, :perk5, :perk3var1, :damage_self_mitigated,
                    :magical_damage_taken, :first_inhibitor_kill, :true_damage_taken, :node_neutralize,
                    :assists, :combat_player_score, :perk_primary_style, :gold_spent, :true_damage_dealt,
                    :participant_id, :total_damage_taken, :physical_damage_dealt, :sight_wards_bought_in_game,
                    :total_damage_dealt_to_champions, :physical_damage_taken, :total_player_score, :win,
                    :objective_player_score, :total_damage_dealt, :neutral_minions_killed_enemy_jungle,
                    :deaths, :wards_placed, :perk_sub_style, :turret_kills, :first_blood_kill,
                    :true_damage_dealt_to_champions, :gold_earned, :killing_sprees, :unreal_kills, :altars_captured,
                    :first_tower_assist, :first_tower_kill, :champ_level, :double_kills, :node_capture_assist,
                    :inhibitor_kills, :first_inhibitor_assist, :perk0var1, :perk0var2, :perk0var3,
                    :vision_wards_bought_in_game, :altars_neutralized, :penta_kills, :total_heal,
                    :total_minions_killed, :time_ccing_others

      def initialize(attrs = {})
        attrs.each do |k, v|
          instance_variable_set("@#{Helpers.underscore(k)}", v)
        end
      end

      def to_h
        {
          first_blood_assist: @first_blood_assist,
          vision_score: @vision_score,
          magic_damage_dealt_to_champions: @magic_damage_dealt_to_champions,
          damage_dealt_to_objectives: @damage_dealt_to_objectives,
          total_time_crowd_control_dealt: @total_time_crowd_control_dealt,
          longest_time_spent_living: @longest_time_spent_living,
          perk1var1: @perk1var1,
          perk1var2: @perk1var2,
          perk1var3: @perk1var3,
          triple_kills: @triple_kills,
          perk3var3: @perk3var3,
          node_neutralize_assist: @node_neutralize_assist,
          perk3var2: @perk3var2,
          player_score_0: @player_score_0,
          player_score_1: @player_score_1,
          player_score_2: @player_score_2,
          player_score_3: @player_score_3,
          player_score_4: @player_score_4,
          player_score_5: @player_score_5,
          player_score_6: @player_score_6,
          player_score_7: @player_score_7,
          player_score_8: @player_score_8,
          player_score_9: @player_score_9,
          kills: @kills,
          perk5var1: @perk5var1,
          perk5var2: @perk5var2,
          perk5var3: @perk5var3,
          total_score_rank: @total_score_rank,
          neutral_minions_killed: @neutral_minions_killed,
          damage_dealt_to_turrets: @damage_dealt_to_turrets,
          physical_damage_dealt_to_champions: @physical_damage_dealt_to_champions,
          node_capture: @node_capture,
          largest_multi_kill: @largest_multi_kill,
          perk2var1: @perk2var1,
          perk2var2: @perk2var2,
          perk2var3: @perk2var3,
          total_units_healed: @total_units_healed,
          perk4var1: @perk4var1,
          perk4var2: @perk4var2,
          perk4var3: @perk4var3,
          wards_killed: @wards_killed,
          largest_critical_strike: @largest_critical_strike,
          largest_killing_spree: @largest_killing_spree,
          quadra_kills: @quadra_kills,
          team_objective: @team_objective,
          magic_damage_dealt: @magic_damage_dealt,
          item0: @item0,
          item1: @item1,
          item2: @item2,
          item3: @item3,
          item4: @item4,
          item5: @item5,
          item6: @item6,
          neutral_minions_killed_team_jungle: @neutral_minions_killed_team_jungle,
          perk1: @perk1,
          perk2: @perk2,
          perk3: @perk3,
          perk4: @perk4,
          perk5: @perk5,
          perk3var1: @perk3var1,
          damage_self_mitigated: @damage_self_mitigated,
          magical_damage_taken: @magical_damage_taken,
          first_inhibitor_kill: @first_inhibitor_kill,
          true_damage_taken: @true_damage_taken,
          node_neutralize: @node_neutralize,
          assists: @assists,
          combat_player_score: @combat_player_score,
          perk_primary_style: @perk_primary_style,
          gold_spent: @gold_spent,
          true_damage_dealt: @true_damage_dealt,
          participant_id: @participant_id,
          total_damage_taken: @total_damage_taken,
          physical_damage_dealt: @physical_damage_dealt,
          sight_wards_bought_in_game: @sight_wards_bought_in_game,
          total_damage_dealt_to_champions: @total_damage_dealt_to_champions,
          physical_damage_taken: @physical_damage_taken,
          total_player_score: @total_player_score,
          win: @win,
          objective_player_score: @objective_player_score,
          total_damage_dealt: @total_damage_dealt,
          neutral_minions_killed_enemy_jungle: @neutral_minions_killed_enemy_jungle,
          deaths: @deaths,
          wards_placed: @wards_placed,
          perk_sub_style: @perk_sub_style,
          turret_kills: @turret_kills,
          first_blood_kill: @first_blood_kill,
          true_damage_dealt_to_champions: @true_damage_dealt_to_champions,
          gold_earned: @gold_earned,
          killing_sprees: @killing_sprees,
          unreal_kills: @unreal_kills,
          altars_captured: @altars_captured,
          first_tower_assist: @first_tower_assist,
          first_tower_kill: @first_tower_kill,
          champ_level: @champ_level,
          double_kills: @double_kills,
          node_capture_assist: @node_capture_assist,
          inhibitor_kills: @inhibitor_kills,
          first_inhibitor_assist: @first_inhibitor_assist,
          perk0var1: @perk0var1,
          perk0var2: @perk0var2,
          perk0var3: @perk0var3,
          vision_wards_bought_in_game: @vision_wards_bought_in_game,
          altars_neutralized: @altars_neutralized,
          penta_kills: @penta_kills,
          total_heal: @total_heal,
          total_minions_killed: @total_minions_killed,
          time_ccing_others: @time_ccing_others
        }
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