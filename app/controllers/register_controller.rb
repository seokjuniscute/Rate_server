class RegisterController < ApplicationController
    def register
        if(User.exists?(ide: params[:id]))
            head :forbidden
        elsif(!(User.exists?(ide: params[:id])))
            User.create(ide: params[:id],password: params[:password],created_at: Time.inspect)
            head :ok
	   
        else
	    head :internal_server_error
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
            user.hour = params[:hour]
            user.min = params[:min]
            if(user.save)
                head :ok
            else 
                head :internal_server_error
            end
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
