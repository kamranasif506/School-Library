require_relative '../capitalizedecorator'

describe CapitalizeDecorator do
  before :each do
    @capitalize_decorator = CapitalizeDecorator.new('Ichsan')
  end

  it 'should return an instance of CapitalizeDecorator' do
    expect(@capitalize_decorator).to be_an_instance_of CapitalizeDecorator
  end
end
