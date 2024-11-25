require "open-uri"
class GamesController < ApplicationController

  def new
    @letters = ("A".."Z").to_a.sample(10)
  end

  def score
    word = params[:word]
    respuesta = api_consult(word)
    if respuesta
      @answer = "It is a #{word} in English."
    else
      @answer = "The #{word} doesn't exist."
    end
  end

  private

  def api_consult
    api_response = URI.open("https://dictionary.lewagon.com/#{word}").read
    response_in_hash =JSON.parse(api_response)
    return response_in_hash["found"]
  end
end
