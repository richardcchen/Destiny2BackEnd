class Api::V1::Manifest::InventorybucketsController < ApplicationController
  def index
    @manifestInvBucket = ManifestInvBucket.all
    render json: @manifestInvBucket
  end
end
