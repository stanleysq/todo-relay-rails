Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :node, GraphQL::Relay::Node.field
  field :nodes, GraphQL::Relay::Node.plural_field

  connection :todos, Types::TodoType.connection_type do
    resolve ->(_query, _args, _ctx) { Todo.all }
  end
end
