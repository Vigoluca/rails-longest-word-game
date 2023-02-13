require 'json'
require 'open-uri'
class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10).join(' ')
  end

  def score
    @sample = params[:letters].split(' ')
    @answer = params[:answer]
    @included = @answer.split('').all? do |letter|
      @sample.include?(letter)
    end
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    user_serialized = URI.open(url).read
    valid = JSON.parse(user_serialized)
    @english_word = valid['found']
    # @test = if @answer.split("").all?
    #           'Good job is a match'
    #         else
    #           "You need to use only these letters: #{@sample}"
    #         end
  end
end
