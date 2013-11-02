require File.expand_path('../../../spec_helper', __FILE__)

describe OmniAuth::Strategies::HttpsX509 do
  def app; lambda {|env| [200, {}, ["Hello HttpsX509!"]]}; end

  let(:fresh_strategy) { Class.new OmniAuth::Strategies::HttpsX509 }
  subject { fresh_strategy }

  it 'should be initialized with authentication endpoint' do
    instance = subject.new(app, "https://www.example.com/httpauth")
    instance.options.endpoint.should == "https://www.example.com/httpauth"
  end
end
