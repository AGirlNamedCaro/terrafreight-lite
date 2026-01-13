class ShipmentsController < ApplicationController
  before_action :set_shipment, only: %i[show edit update destroy]

  def index
    @shipments = Shipment.all.order(created_at: :desc)
  end

  def show; end

  def new
    @shipment = Shipment.new
  end

  def create
    @shipment = Shipment.new(shipment_params)
    if @shipment.save
      redirect_to @shipment, notice: "Shipment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @shipment.update(shipment_params)
      respond_to do |format|
        format.html { redirect_to shipments_path, notice: "Shipment was successfully updated." }
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@shipment, partial: "shipments/shipment", locals: { shipment: @shipment }) }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @shipment.destroy
    redirect_to shipments_url, notice: "Shipment was successfully destroyed."
  end

  private

  def set_shipment
    @shipment = Shipment.find(params[:id])
  end

  def shipment_params
    params.require(:shipment).permit(:origin_lat, :origin_lng, :destination_lat, :destination_lng)
  end
end
