require 'spec_helper'
require 'web_doc'

describe WebDoc do
  it "should be defined" do
    expect { WebDoc }.to_not raise_error
  end

  it "should have a VERSION constant" do
    subject.const_get('VERSION').should_not be_empty
  end
end
