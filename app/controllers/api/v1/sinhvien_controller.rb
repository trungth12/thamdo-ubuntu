class Api::V1::SinhvienController < ActionController::Base
	def thamdo
		surveyid = Survey.by_activated
    	@sinh_viens = Sinhvien.where(survey_id: surveyid).by_masinhvien(params[:id].strip).by_voted.select([:id,:tenmon, :survey_id, :mamon])

    respond_to do |format|      
      format.json { render json: @sinh_viens }
    end
	end
end