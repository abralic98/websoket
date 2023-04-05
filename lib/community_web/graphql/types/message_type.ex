defmodule CommunityWeb.Graphql.Types.MessageType do
  use Absinthe.Schema.Notation

  object :message do
    field :id, non_null(:id)
    field :message, non_null(:string)
    field :user, :user
  end
end
