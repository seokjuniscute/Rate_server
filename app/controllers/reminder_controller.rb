class ReminderController < ApplicationController
    def get_reminder
        if(User.exists?(ide: params[:id]))
            if(params[:content] == "")
                head :bad_request
            elsif(params[:hours].to_i < 0 || params[:hours].to_i > 24 || params[:minutes].to_i < 0 || params[:minutes].to_i > 60 || params[:importance].to_i < 0 || params[:importance].to_i > 5)
                head :bad_request
            elsif(params[:month].to_i>12 || params[:month].to_i < 0 || params[:day].to_i > 31 || params[:day].to_i < 0 || params[:year].to_i < 0)
                head :bad_request
            else
                Reminder.create(ide: params[:id], content: params[:content], hour: params[:hours].to_i,min: params[:minutes].to_i,year: params[:year].to_i,month: params[:month].to_i,day: params[:month].to_i,importance: params[:importance].to_i)
                head :ok
            end
        elsif(!(User.exists?(ide: params[:id])))
            head :forbidden
        else
            head :internal_server_error
        end
    end

    def send_reminder
        if(User.exists?(ide: params[:id]))
            if(!(params[:hours].to_i < 0 || params[:hours].to_i > 24 || params[:minutes].to_i < 0 || params[:minutes].to_i > 60) )
                if(Reminder.exists?(ide: params[:id],year: params[:year].to_i,month: params[:month].to_i,hour: params[:hours].to_i,month: params[:month].to_i,day: params[:day].to_i))
                    reminder = Reminder.find_by(ide: params[:id], year: params[:year].to_i, min: params[:minutes].to_i, hour: params[:hours].to_i, month: params[:month].to_i, day: params[:day].to_i)
                    render json: {
                        "content": reminder.content,
                        "importance": reminder.importance
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
    
    def delete_reminder
        if(User.exists?(ide: params[:id]))
            if(Reminder.exists?(ide: params[:id],year: params[:year].to_i,month: params[:month].to_i,hour: params[:hours].to_i,month: params[:month].to_i,day: params[:day].to_i))
                reminder = Reminder.find_by(ide: params[:id], year: params[:year].to_i, min: params[:minutes].to_i, hour: params[:hours].to_i, month: params[:month].to_i, day: params[:day].to_i)
                reminder.destroy
                head :ok
            else
                head :forbidden
            end
        else
            head :forbidden
        end
    end
end
