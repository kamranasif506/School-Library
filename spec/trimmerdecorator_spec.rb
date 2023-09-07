require_relative '../trimmerdecorator'

describe TrimmerDecorator do
  before :each do
    @trimmer_decorator = TrimmerDecorator.new('Ichsan')
  end

  it 'should return an instance of TrimmerDecorator' do
    expect(@trimmer_decorator).to be_an_instance_of TrimmerDecorator
  end
end
