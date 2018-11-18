class Api::UsersController < ApplicationController
  def create
    service = Users::CreateService.call(params: user_params)
    if service.success?
      render json: {}
    else
      render json: { errors: service.errors }, status: :internal_server_error
    end
  end

  def auth
    render json: {
      token: ::Knock::AuthTokenController.new.create(
        params: params,
        field: :username
      )
    }
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username)
  end

  def auth_params
    params.require(:auth).permit(:username, :password)
  end
end
