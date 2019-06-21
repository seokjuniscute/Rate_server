class RegisterController < ApplicationController
    def register
        if(User.exists?(ide: params[:id]))
            render json: {
                "success": false,
                "msg": "아이디가 중복입니다" 
            }
        elsif(!(User.exists?(ide: params[:id])))
            User.create(ide: params[:id],password: params[:password],created_at: Time.inspect)
            
            render json: {
                "success": true,
                "msg": "회원가입을 환영합니다."
            }   
        end
    end

    def check
        if(User.exists?(ide: params[:id]))
            if(User.exists?(password: params[:password]))
                render json: {
                    "success": true,
                    "msg": "로그인에 성공하였습니다."
                }
            elsif(!(User.exists?(password: params[:password])))
                render json: {
                    "success": false,
                    "msg": "비밀번호가 틀립니다."
                }
            end
        else
            render json: {
                "success": false,
                "msg": "아이디가 틀립니다."
            }
        end
    end

    def set_time
        if(User.exists?(ide: params[:id]))
            user = User.find_by(ide: params[:id])
            user.hour = params[:hour]
            user.min = params[:min]
            if(user.save)
                render status: 200
            else 
                render status: 500
            end
        else
            render status: 400
        end
    end
end
