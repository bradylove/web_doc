require 'spec_helper'
require 'web_doc'

describe WebDoc do
  it "should be defined" do
    expect { WebDoc }.to_not raise_error
  end

  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end

  it "should have an input setting" do
    WebDoc.input = "/home/user/docs_in"
    expect(WebDoc.input).to eq "/home/user/docs_in"
  end

  it "should have an output setting" do
    WebDoc.output = "/home/user/docs_out"
    expect(WebDoc.output).to eq "/home/user/docs_out"
  end

  it "should have a nice config block" do
    WebDoc.config do |c|
      c.input  = "/home/user/docs_in"
      c.output = "/home/user/docs_out"
    end

    expect(WebDoc.input).to eq "/home/user/docs_in"
    expect(WebDoc.output).to eq "/home/user/docs_out"
  end
end
