require 'rails_helper'

RSpec.feature "ShopLikes", type: :feature do
	let(:user) {create :user}
	let(:shop) {build :shop}

	before do
		log_in(user)
		register_shop(shop)
	end

	scenario"shop_like_button" do
		visit shops_path
		click_button 'Like!'
		expect(page).to have_content I18n.t('shop_likes.flash.liked_shop')

		visit shops_path
		click_button 'Liked'
		expect(page).to have_content I18n.t('shop_likes.flash.canceled_shop_like')
	end
end