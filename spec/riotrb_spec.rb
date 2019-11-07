RSpec.describe Rioter do

  it "should fail if no api_key is provided" do
    expect { Rioter::Client.new(api_key: nil, region: "na1") }.to raise_error(StandardError)
  end

  it "should fail if api_key is invalid" do
    expect { Rioter::Client.new(api_key: "", region: "na1") }.to raise_error(StandardError)
  end
end
