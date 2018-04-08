module Api
  module V1
    class UsersController < Api::V1::BaseController
      before_action :set_user

      def create
        user = User.create(users_params)
        if user.save
          render json: user, status: 201
        else
          render json: { errors: user.errors }, status: 422
        end
      end

      private

      def set_user
        user = User.find_by_email(users_params[:email])
        head 404 if user.present?
      end

      def users_params
        params.require(:user).permit(:username, :email)
      end
    end
  end
end
