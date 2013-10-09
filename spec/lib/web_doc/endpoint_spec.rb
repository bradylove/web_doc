require 'spec_helper'

describe WebDoc::Endpoint do
  let(:endpoint) { WebDoc::Endpoint.new(:post, "/api/v1/user", {}, {}) }

  it "should exist" do
    expect { WebDoc::Endpoint }.to_not raise_error
  end

  it "should initialize with instance variables" do
    expect(endpoint.verb).to eq :post
    expect(endpoint.path).to eq "/api/v1/user"
    expect(endpoint.title).to eq ""
    expect(endpoint.description).to eq ""
    expect(endpoint.incoming).to eq({})
    expect(endpoint.outgoing).to eq({})
  end

  it "should slugify the title for the id" do
    endpoint.title = "Some Really Awesome Title"

    expect(endpoint.id).to eq "some_really_awesome_title"
  end

  context "#description" do
    it "should set the description if one is given otherwise return it" do
      endpoint.description "Super sweet description"
      expect(endpoint.description).to eq "Super sweet description"
    end
  end

  context "title" do
    it "should set the title if one is given otherwise return it" do
      endpoint.title "Sweet title"
      expect(endpoint.title).to eq "Sweet title"
    end
  end

  context "adding parameters" do
    it "should add an incoming parameter" do
      endpoint.takes(:string, :username, "The new users username")

      expect(endpoint.incoming[:username]).to eq({
          type:        :string,
          description: "The new users username",
          options:     {}
        })
    end

    it "should add an outgoing parameter" do
      endpoint.returns(:string, :username, "The new users username")

      expect(endpoint.outgoing[:username]).to eq({
          type:        :string,
          description: "The new users username",
          options:     {}
        })
    end
  end
end