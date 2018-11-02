class Api::V1::Manifest::ItemstatsController < ApplicationController
  def index
    @stats = Stat.all
    render json: @stats
  end
end
