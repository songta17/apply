class CommunesController < ApplicationController
  before_action :find_commune, only: [:show, :update]

  def index
    @communes = Commune.all
    respond_to do |format|
      format.json { render json: @communes, status: 200 } 
      format.html { render html: '', status: 406 } 
      format.csv { send_data @communes.to_csv, filename: 'export_communes.csv', status: 200 } 
    end
  end

  def create
    render json: {}, status: 403
  end
  
  def show
    if @commune.present?
      render json: @commune, status: 200
    else
      render json: {}, status: 404
    end
  end

  def update
    if !@commune.present?
      render json: {}, status: 404
    else
      if !(params && params[:commune].present?)
        render json: {}, status: 400
      elsif @commune.update(commune_params)
        render json: @commune, status: 204
      end
    end
  end

  private

  def find_commune
    @commune = Commune.where(code_insee: params[:id])
  end

  def commune_params
    params.require(:commune).permit(:name, :code_insee)
  end
end
