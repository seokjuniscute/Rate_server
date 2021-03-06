class RegisterController < ApplicationController
    def register
	if(params[:password] == "" || params[:id] == "")
        head :bad_request
    
	elsif(params[:hours].to_i < 0 || params[:hours].to_i > 24 || params[:minutes].to_i < 0 || params[:minutes].to_i > 60 )
	    head :bad_request
	else
	    if(User.exists?(ide: params[:id]))
               head :forbidden
        elsif(!(User.exists?(ide: params[:id])))
               User.create(ide: params[:id],password: params[:password],created_at: Time.inspect,hour: params[:hours].to_i, min: params[:minutes].to_i)
               head :ok
	    else
	        head :internal_server_error
        end
	end
	
	   
	
        
    end

    def check
        if(User.exists?(ide: params[:id]))
            if(User.exists?(password: params[:password]))
                head :ok
            elsif(!(User.exists?(password: params[:password])))
           	    head :forbidden
            end
        else
		head :forbidden
        end
    end

    def set_time
        if(User.exists?(ide: params[:id]))
            user = User.find_by(ide: params[:id])
            user.hour = params[:hours]
            user.min = params[:minutes]
            if(user.save)
                head :ok
            else 
                head :internal_server_error
            end
        elsif(!(User.exists?(ide: params[:id])))
            head :forbidden
        else
            head :internal_server_error
        end
    end
    def send_time
        if(User.exists?(ide: params[:id]))
            user = User.find_by(ide: params[:id])
            render json: {
                "hours": user.hour,
                "minutes": user.min
            }
        elsif(!(User.exists?(ide: params[:id])))
            head :forbidden 
        else
            head :internal_server_error
        end
    end
    def id_check
	if(User.exists?(ide: params[:id]))
	   head :forbidden
	elsif(!(User.exists?(ide: params[:id])))
	   head :ok
	end
    end
end
