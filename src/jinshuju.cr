require "halite"
require "json"

module Jinshuju
  VERSION = "0.1.0"

  class Entry
    include JSON::Serializable

    @[JSON::Field(key: "field_12")]
    property name : String

    @[JSON::Field(key: "field_5")]
    property mobile : String

    @[JSON::Field(key: "field_7")]
    property organ : String

    @[JSON::Field(key: "field_6")]
    property idcard : String
  end

  class Entries 
    include JSON::Serializable

    property total : Int32
    property count : Int32
    property data : Array(Entry)

    @[JSON::Field(key: "next")]
    property loc : Int32?
  end


  class API
    property host, key, secret

    def initialize(host : String, key : String, secret : String)
      @key = key
      @secret = secret
      @host = host
    end

    def get_entries(form, loc=0)
      return [] of Entry if loc.nil?

      url = "https://#{@host}/api/v1/forms/#{form}/entries"
      r = Halite.basic_auth(user: @key, pass: @secret).get(url, params: { next: loc })
      raise r.body.to_s unless r.status_code == 200

      values = Entries.from_json r.body.to_s
      values.data + get_entries(form, values.loc)
    end
  end
end
