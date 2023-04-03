defmodule CommunityWeb.Graphql.Types.CompanyType do

  use Absinthe.Schema.Notation

  object :company do
    field :id, non_null(:id)
    field :name, :string
  end
end
