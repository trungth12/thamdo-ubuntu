class Api::V1::SinhvienController < ActionController::Base
	def thamdo
    @sinh_viens = Sinhvien.by_masinhvien(params[:id].strip).by_voted.pluck(:tenmon)

    respond_to do |format|      
      format.json { render json: @sinh_viens }
    end
	end
end