class PermissionSerializer < ActiveModel::Serializer
  attributes :id, :action, :value, :created_at
end
