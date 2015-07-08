require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        v1 = Vote.new(value: 1 || value: -1)
        v2 = Vote.new(value:3)

        expect(v1.valid?).to eq(true)
        expect(v2.valid?).to eq(false)
      end
    end
  end
end