class CaseSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :categories
end
