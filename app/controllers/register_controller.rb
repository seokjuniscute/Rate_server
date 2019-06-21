class RegisterController < ApplicationController
    def register
        if(User.exists?(ide: params[:id]))
            render status: 403
	    render nothing: true
        elsif(!(User.exists?(ide: params[:id])))
            User.create(ide: params[:id],password: params[:password],created_at: Time.inspect)
            render status: 200
	    render nothing: true
        else
	    render status: 500 
	    render nothing: true
        end
    end

    def check
        if(User.exists?(ide: params[:id]))
            if(User.exists?(password: params[:password]))
                render status: 200
    		render nothing: true
            elsif(!(User.exists?(password: params[:password])))
           	render status: 403
		render nothing: true
            end
        else
		render status: 403
		render nothing: true
        end
    end

    def set_time
        if(User.exists?(ide: params[:id]))
            user = User.find_by(ide: params[:id])
            user.hour = params[:hour]
            user.min = params[:min]
            if(user.save)
                render status: 200
		render nothing: true
            else 
                render status: 500
		render nothing: true
            end
        else
            render status: 400
	    render nothing: true
        end
    end

    def id_check
	if(User.exists?(ide: params[:id]))
	   render status: 403
	elsif(!(User.exists?(ide: params[:id])))
	   render status: 200
	end
    end
end
