TodoRelayRailsSchema = GraphQL::Schema.define do
  mutation Types::MutationType
  query Types::QueryType

  resolve_type ->(_type, obj, _ctx) do
    "Types::#{obj.item.class.name}Type".constantize
  end

  id_from_object ->(object, _type_definition, _query_ctx) {
    # if one class can be resolved to many types in your application:
    # GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
    # and then change object_from_id below accordingly
    GraphQL::Schema::UniqueWithinType.encode(object.class.name, object.id)
  }

  object_from_id ->(id, _query_ctx) {
    class_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    Object.const_get(class_name).find(item_id)
  }
end
