class Api::V1::Manifest::StatsController < ApplicationController
  def index
    @manifestStat = ManifestStat.all
    render json: @manifestStat
  end
end
