# frozen_string_literal: true

require "spec_helper"
require "decidim/api/test/type_context"

module Decidim
  describe UserType, type: :graphql do
    include_context "graphql type"

    let(:model) { create(:user) }

    describe "name" do
      let(:query) { "{ name }" }

      it "returns all the required fields" do
        expect(response).to include("name" => model.name)
      end
    end

    describe "isAuthorized" do
      let(:query) { "{ isAuthorized }" }

      it "returns false when not authorized" do
        allow(model).to receive(:authorized?).and_return false
        expect(response).to include("isAuthorized" => false)
      end

      it "returns true when authorized" do
        allow(model).to receive(:authorized?).and_return true
        expect(response).to include("isAuthorized" => true)
      end
    end

    describe "avatarUrl" do
      let(:query) { "{ avatarUrl }" }

      it "returns the user avatar url" do
        expect(response).to include("avatarUrl" => model.avatar.url)
      end
    end

    describe "organizationName" do
      let(:query) { "{ organizationName }" }

      it "returns the user's organization name" do
        expect(response).to include("organizationName" => model.organization.name)
      end
    end
  end
end
