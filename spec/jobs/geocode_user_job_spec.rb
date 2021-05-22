require 'rails_helper'

RSpec.describe GeocodeUserJob, type: :job do
  it "userのgeocodeを呼ぶこと" do
    user = instance_double("User")
    expect(user).to receive(:geocode)
    GeocodeUserJob.perform_now(user)
  end
end
