require 'spec_helper'
require 'SplitHash'

describe SplitHash do
  it "should return correct array when 1 split key" do
    expect(SplitHash.new.splithash({:a => '1'}, :a)).to eq([{:a => '1'}])
  end

  it "should return correct array when two hashes with 1 split keys" do
    expect(SplitHash.new.splithash({:a => '1', :b => '2'}, :a)).to eq([{:a => '1', :b => '2'}])
  end

  it "should return correct array when two hashes with two split keys" do
    expect(SplitHash.new.splithash({:a => '1', :b => '2', :c => '3', :d => '4'}, :a, :c)).to eq([{:a => '1', :b => '2'}, {:c => '3', :d => '4'}])
  end

  it "should return correct array when hashes with more than two split keys" do
    expect(SplitHash.new.splithash({:a => '1', :b => '2', :c => '3', :d => '4', :e => '5', :f => '6'}, :a, :d, :e)).to eq([{:a => '1', :b => '2', :c => '3'}, {:d => '4'}, {:e => '5', :f => '6'}])
  end

  it "should return correct array when first hash key does not match the split key" do
    expect(SplitHash.new.splithash({:h => '8', :a => '1', :b => '2', :c => '3', :d => '4', :e => '5', :f => '6'}, :a, :d, :e)).to eq([{:h => '8'}, {:a => '1', :b => '2', :c => '3'}, {:d => '4'}, {:e => '5', :f => '6'}])
  end

  it "should return correct array when key is not symbol" do
    expect(SplitHash.new.splithash({'h' => 8, 'a' => '1', 'b' => '2', 'c' => '3', 'd' => '4', 'e' => '5', 'f' => '6'}, 'a', 'd', 'e')).to eq([{"h" => 8}, {"a" => '1', "b" => '2', "c" => '3'}, {"d" => '4'}, {"e" => '5', "f" => '6'}])
  end

  it "should raise error if split key is not found" do
    expect{SplitHash.new.splithash({'h' => 8, 'a' => '1', 'b' => '2', 'c' => '3', 'd' => '4', 'e' => '5', 'f' => '6'}, 'a', 'z', 'e')}.to raise_error
  end
end
