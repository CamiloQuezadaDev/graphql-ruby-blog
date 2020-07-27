module Types
  class ClapType < Types::BaseObject
    field :id, ID, null: false
    field :clapped_by, Types::UserType, null: true, method: :user
    field :post, Types::PostType, null: true
  end
end
