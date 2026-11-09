require 'time'

class HiController < ApplicationController
  def index
    @stud = 'Я - студент, Василь ПУПКІН!'
    @message = 'прийшло з
Контролера'
    @time = Time.now
  end
end
