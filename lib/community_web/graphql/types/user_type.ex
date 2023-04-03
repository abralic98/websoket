defmodule CommunityWeb.Graphql.Types.UserType do

  use Absinthe.Schema.Notation

  object :user do
    field :id, non_null(:id)
    field :username, non_null(:string)
  end

end
