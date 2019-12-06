require 'rails_helper'

RSpec.describe Impression, type: :model do
	before do
		@impression = build(:impression)
	end

	describe "validation" do
		it"is invalid without i_sour" do
			@impression.i_sour = ""
			expect(@impression.valid?).to eq(false)
		end

		it"is invalid without i_sweet" do
			@impression.i_sweet = ""
			expect(@impression.valid?).to eq(false)
		end

		it"is invalid without i_bitter" do
			@impression.i_bitter = ""
			expect(@impression.valid?).to eq(false)
		end

		it"i_comment not be over 50" do
			@impression.i_comment = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
			expect(@impression.valid?).to eq(false)
		end

	end
end
