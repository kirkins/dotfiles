require 'spec_helper'
describe 'nvm' do
  context 'with default values for all parameters' do
    it { should contain_class('nvm') }
  end
end
