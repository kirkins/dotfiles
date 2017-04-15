require 'spec_helper'
describe 'i3' do
  context 'with default values for all parameters' do
    it { should contain_class('i3') }
  end
end
