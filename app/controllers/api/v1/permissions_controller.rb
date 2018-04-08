module Api
  module V1
    class PermissionsController < Api::V1::BaseController
      before_action :check_entity_type, :set_entity

      def action_permitted
        permission = @entity.permissions.find_by(action: permissions_params[:action])
        if permission.present?
          render json: permission, status: 200
        else
          render json: permission, status: 404
        end
      end

      def create
        permission = Permission.grant_permission_to_user(permissions_params, @entity)
        if permission.present?
          render json: permission, status: 201
        else
          render json: { errors: ["#{@entity.class.name} already has this permission."] }, status: 422
        end
      end

      private

      def check_entity_type
        head 400 unless %w[Role User].include? entity_params[:type]
      end

      def set_entity
        @entity = entity_params[:type].constantize.find_by_id(entity_params[:id])
        head 404 unless @entity.present?
      end

      def permissions_params
        params.require(:permissions).permit(:action, :value)
      end

      def entity_params
        params.require(:entity).permit(:id, :type, :username)
      end
    end
  end
end
