#encoding:utf-8
require 'spec_helper'

describe NumberToCn do
  it "should go works" do
    (2203.to_cn_words).should eq("贰仟贰佰零叁")
  end

  it "worked for zero" do
    (0.to_cn_words).should eq("零")
  end

  it "worked for float" do
    ((33.0).to_cn_words).should eq("叁拾叁点零")
  end 
  
  it "works in clear transfer" do 
    (203.to_cn_clearly).should eq("贰零叁")
  end
end
