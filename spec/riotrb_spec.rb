RSpec.describe Riotrb do

  it "should fail if no api_key is provided" do
    expect { Riotrb::Client.new(api_key: nil, region: "na1") }.to raise_error(StandardError)
  end

  it "should fail if api_key is invalid" do
    expect { Riotrb::Client.new(api_key: "", region: "na1") }.to raise_error(StandardError)
  end
end
