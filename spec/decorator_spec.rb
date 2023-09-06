require_relative '../basedecorator'
require_relative '../capitalizedecorator'
require_relative '../trimmerdecorator'

describe BaseDecorator do
  before :each do
    @base_decorator = BaseDecorator.new('Ichsan')
  end

  it 'should return an instance of BaseDecorator' do
    expect(@base_decorator).to be_an_instance_of BaseDecorator
  end
end

describe CapitalizeDecorator do
  before :each do
    @capitalize_decorator = CapitalizeDecorator.new('Ichsan')
  end

  it 'should return an instance of CapitalizeDecorator' do
    expect(@capitalize_decorator).to be_an_instance_of CapitalizeDecorator
  end
end

describe TrimmerDecorator do
  before :each do
    @trimmer_decorator = TrimmerDecorator.new('Ichsan')
  end

  it 'should return an instance of TrimmerDecorator' do
    expect(@trimmer_decorator).to be_an_instance_of TrimmerDecorator
  end
end