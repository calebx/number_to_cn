#encoding:utf-8
require 'spec_helper'

describe NumberToCn do
  it "should go works" do
    (2203.to_cn_words).should == "贰仟贰佰零叁"
  end
  
end
