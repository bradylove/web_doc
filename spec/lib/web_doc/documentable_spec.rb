require 'spec_helper'

describe WebDoc::Documentable do
  let(:mock_doc) { MockDoc }

  it "should be defined" do
    expect { WebDoc::Documentable }.to_not raise_error
  end

  it "should slugify the title for an id" do
    expect(mock_doc.id).to eq "mock_document"
  end

  it "should have a title" do
    expect(mock_doc.title).to eq "Mock Document"
  end

  it "should have a description" do
    expect(mock_doc.description).to eq "Mock Document for RSpec testing"
  end

  it "should have a base path" do
    expect(mock_doc.base_path).to eq "/api/v1"
  end

  it "should have common takes" do
    expect(mock_doc.common_takes).to eq({
      name: {
        type:        :string,
        description: "Just a name",
        options:     {}
      }
    })
  end

  it "should have common returns" do
    expect(mock_doc.common_returns).to eq({
      code: {
        type:        :integer,
        description: "Just a code",
        options:     {}
      }
    })
  end

  it "should have a get endpoint /users" do
    expect(mock_doc.endpoints[0].path).to eq "/api/v1/users"
    expect(mock_doc.endpoints[0].verb).to eq :get
    expect(mock_doc.endpoints[0].title).to eq "Get Users"
    expect(mock_doc.endpoints[0].description).to eq "Get a list of users"
  end

  it "should have a post endpoint /users" do
    expect(mock_doc.endpoints[1].path).to eq "/api/v1/users"
    expect(mock_doc.endpoints[1].verb).to eq :post
    expect(mock_doc.endpoints[1].title).to eq "Create User"
    expect(mock_doc.endpoints[1].description).to eq "Creates a new user"
    expect(mock_doc.endpoints[1].incoming.size).to eq 3
  end

  it "should have a put endpoint /users/:id" do
    expect(mock_doc.endpoints[2].path).to eq "/api/v1/users/:id"
    expect(mock_doc.endpoints[2].verb).to eq :put
    expect(mock_doc.endpoints[2].title).to eq "Update User"
    expect(mock_doc.endpoints[2].description).to eq "Updates a users account"
  end

  it "should have a patch endpoint /users/:id" do
    expect(mock_doc.endpoints[3].path).to eq "/api/v1/users/:id"
    expect(mock_doc.endpoints[3].verb).to eq :patch
    expect(mock_doc.endpoints[3].title).to eq "Update User"
    expect(mock_doc.endpoints[3].description).to eq "Updates a users account"
  end

  it "should have a delete endpoint /users/:id" do
    expect(mock_doc.endpoints[4].path).to eq "/api/v1/users/:id"
    expect(mock_doc.endpoints[4].verb).to eq :delete
    expect(mock_doc.endpoints[4].title).to eq "Delete User"
    expect(mock_doc.endpoints[4].description).to eq "Deletes a users account"
  end

  it "should have a options endpoint /users/:id" do
    expect(mock_doc.endpoints[5].path).to eq "/api/v1/users/:id"
    expect(mock_doc.endpoints[5].verb).to eq :options
    expect(mock_doc.endpoints[5].title).to eq "Options User"
    expect(mock_doc.endpoints[5].description).to eq "Preflight request for CORS"
  end
end