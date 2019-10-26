require 'riotrb/version'
require 'typhoeus'

module Riotrb
  class Error < StandardError; end

  def self.headers
    {
      "Accept-Charset" => "application/x-www-form-urlencoded; charset=UTF-8",
      "Accept-Language" => "en-US,en;q=0.9,pt;q=0.8",
      "User-Agent" => "riotrb-0.1.0",
      "X-Riot-Token": ENV['RIOT_API_TOKEN']
    }
  end

  def self.third_party_code(encrypted_summoner_id:)
    request = Typhoeus::Request.new(
      "https://na1.api.riotgames.com/lol/platform/v4/third-party-code/by-summoner/#{encrypted_summoner_id}",
      method: :get,
      headers: headers
    )
    request.run
  end
end
