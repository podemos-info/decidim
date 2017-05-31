# frozen_string_literal: true

module Decidim
  # This interface represents an author who owns a resource.
  AuthorInterface = GraphQL::InterfaceType.define do
    name "Author"
    description "An author"

    field :name, !types.String, "The author's name"
    field :avatarUrl, !types.String, "The author's avatar url"
    field :isVerified, !types.Boolean, "Whether the author is verified or not" do
      resolve lambda { |obj, _args, _ctx|
        obj.verified?
      }
    end
  end
end
