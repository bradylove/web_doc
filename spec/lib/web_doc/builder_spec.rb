require 'spec_helper'

describe WebDoc::Builder do
  context "initialization" do
    let(:builder) { WebDoc::Builder.new(MockDoc, "tmp/outpath") }

    it "should initialize with a module" do
      expect(builder.mod).to eq MockDoc
    end

    it "should initialize with an output path" do
      expect(builder.output).to eq "tmp/outpath"
    end

    it "should raise an error without a module" do
      expect { WebDoc::Builder.new("Hello World", "tmp/outpath") }.to raise_error "Builder must be initialized with a module"
    end
  end

  context "building" do
    let(:builder) { WebDoc::Builder.new(MockDoc, "tmp/outpath") }

    it "should write the index file" do
      builder.build!

      filepath = "tmp/outpath/index.html"
      expect(File.exists?(filepath)).to be_true
    end
  end
end