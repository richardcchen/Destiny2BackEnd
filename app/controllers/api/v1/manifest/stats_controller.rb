class Api::V1::Manifest::StatsController < ApplicationController
  def index
    @manifestStat = ManifestStat.all
    render json: @manifestStat
  end
end

#
# characterIds: [],
# membershipType: -100,
# displayName: "Can't be found",
# membershipId: -100,
# currentEquipment: []
