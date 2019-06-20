class LoginController < ApplicationController
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
end
