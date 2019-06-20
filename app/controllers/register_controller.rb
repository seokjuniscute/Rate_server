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
end
