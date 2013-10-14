require 'spec_helper'
require 'web_doc'

describe WebDoc do
  it "should be defined" do
    expect { WebDoc }.to_not raise_error
  end

  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end

  context "settings" do
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

  context "load docs" do
    it "should load all the docs in the input directory" do
      WebDoc.input = "example/docs"
      WebDoc.load_docs

      expect { Docs }.to_not raise_error
      expect { Docs::Users }.to_not raise_error
    end
  end
end