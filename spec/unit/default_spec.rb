require 'spec_helper'

describe '@cookbook_name::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['attribute']['attribute'] = 'true'
    end.converge('@cookbook_name::default')
  end
  it 'includes another recipe' do
    expect(chef_run).to include_recipe('another')
  end
end
