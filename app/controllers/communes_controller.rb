class CommunesController < ApplicationController

  def index
    @communes = Commune.all
    respond_to do |format|
      format.json { render json: @communes, status: 200 } 
      format.html { render html: '', status: 406 } 
      format.csv { send_data @communes.to_csv, filename: 'export_communes.csv', status: 200 } 
    end
  end
end
