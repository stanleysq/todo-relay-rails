Types::TodoType = GraphQL::ObjectType.define do
  name "Todo"

  implements GraphQL::Relay::Node.interface
  global_id_field :id

  field :title, !types.String
  field :completed, !types.Boolean
end
