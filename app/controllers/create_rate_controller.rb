class CreateRateController < ApplicationController
    def get_rate
        if(User.exists?(ide: params[:id]))
            if(params[:what_you_do] == "" ||params[:what_you_good] == ""||params[:what_you_bad] == "" )
                head :bad_request
            elsif(params[:importance].to_i < 0 || params[:importance].to_i > 5)
                head :bad_request
            elsif(params[:month].to_i>12 || params[:month].to_i < 0 || params[:day].to_i > 31 || params[:day].to_i < 0 || params[:year].to_i < 0)
                head :bad_request
            else
                Rating.create(ide: params[:id], what_you_bad: params[:what_you_bad],what_you_do: params[:what_you_do],what_you_good: [:what_you_good],year: params[:year].to_i,month: params[:month].to_i,day: params[:month].to_i)
                head :ok
            end
        elsif(!(User.exists?(ide: params[:id])))
            head :forbidden
        else
            head :internal_server_error
        end
    end

    def send_rate
        if(User.exists?(ide: params[:id]))
            if(true)
                if(Reminder.exists?(ide: params[:id],year: params[:year],month: params[:month],day: params[:day]))
                    rate = Rating.find_by(ide: params[:id],year: params[:year],month: params[:month],day: params[:day])
                    render json: {
                        "whatyoudo": rate.what_you_do,
                        "whatyougood": rate.what_you_good,
                        "whatyoubad": rate.what_you_bad
                    }
                else
                    head :bad_request
                end
            else
                head :bad_request
            end
        elsif(!(User.exists?(ide: params[:id])))
            head :forbidden
        else
            head :internal_server_error
        end
    end
end
