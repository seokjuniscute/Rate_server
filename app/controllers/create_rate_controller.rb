class CreateRateController < ApplicationController
    def get_rate
        if(User.exists?(ide: params[:id]))
            if(params[:what_you_do] == "" ||params[:what_you_good] == ""||params[:what_you_bad] == "" )
                head :bad_request
            elsif(params[:month].to_i>12 || params[:month].to_i < 0 || params[:day].to_i > 31 || params[:day].to_i < 0 || params[:year].to_i < 0)
                head :bad_request
            else
                if(Rating.exists?(ide: params[:id], month:  params[:month].to_i, year: params[:year].to_i , day: params[:day]) )
                    rate = Rating.find_by(ide: params[:id],year: params[:year].to_i,month: params[:month].to_i,day: params[:day].to_i)
                    rate.what_you_bad = params[:what_you_bad]
                    rate.what_you_do = params[:what_you_do]
                    rate.what_you_good = params[:what_you_good]
                    rate.importance = params[:importance].to_f
                    rate.save
                    head :ok
                    
                else
                    Rating.create(ide: params[:id], what_you_bad: params[:what_you_bad],what_you_do: params[:what_you_do],what_you_good: params[:what_you_good],year: params[:year].to_i,month: params[:month].to_i,day: params[:day].to_i,importance: params[:importance].to_f)
                head :ok
                end
            end
        elsif(!(User.exists?(ide: params[:id])))
            head :forbidden
        else
            head :internal_server_error
        end
    end

    def send_rate
        if(User.exists?(ide: params[:id]))
            if(Rating.exists?(ide: params[:id],year: params[:year].to_i,month: params[:month].to_i,day: params[:day].to_i))
                    rate = Rating.find_by(ide: params[:id],year: params[:year].to_i,month: params[:month].to_i,day: params[:day].to_i)
                    render json: {
                        "whatyoudo": rate.what_you_do,
                        "whatyougood": rate.what_you_good,
                        "whatyoubad": rate.what_you_bad,
                        "importance": rate.importance
                    }
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
