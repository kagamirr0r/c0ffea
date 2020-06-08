require 'rails_helper'

RSpec.feature 'Beans', type: :feature do
  let(:user) { create :user }
  let(:impression) { build :impression }
  let(:another_impression) { build :another_impression }
  before do
    create(:shop)
    log_in(user)
  end

  scenario 'CRUD of bean' do
    # create
    click_on I18n.t('layouts.application.bean')
    click_on 'local_cafe'
    click_on 'local_cafe'
    fill_in 'bean_country', with: impression.bean.country
    fill_in 'bean_area', with: impression.bean.area
    fill_in 'bean_farm', with: impression.bean.farm
    fill_in 'bean_variety', with: impression.bean.variety
    select impression.bean.process_i18n, from: 'bean_process'
    select impression.bean.roast_i18n, from: 'bean_roast'
    fill_in 'bean_price', with: impression.bean.price
    fill_in 'bean_bean_url', with: impression.bean.bean_url
    select impression.i_sour, from: 'bean_impression_attributes_i_sour'
    select impression.i_sweet, from: 'bean_impression_attributes_i_sweet'
    select impression.i_bitter, from: 'bean_impression_attributes_i_bitter'
    fill_in 'bean_impression_attributes_i_comment', with: impression.i_comment
    click_button I18n.t('beans.form.register')
    expect(page).to have_content I18n.t('beans.flash.registered_bean')

    # show
    bean = Bean.last
    visit "/ja/beans/#{bean.id}"
    expect(page).to have_content bean.farm

    # edit
    click_on 'edit'
    fill_in 'bean_country', with: another_impression.bean.country
    fill_in 'bean_area', with: another_impression.bean.area
    fill_in 'bean_farm', with: another_impression.bean.farm
    fill_in 'bean_variety', with: another_impression.bean.variety
    select another_impression.bean.process_i18n, from: 'bean_process'
    select another_impression.bean.roast_i18n, from: 'bean_roast'
    fill_in 'bean_price', with: another_impression.bean.price
    fill_in 'bean_bean_url', with: another_impression.bean.bean_url
    select another_impression.i_sour, from: 'bean_impression_attributes_i_sour'
    select another_impression.i_sweet, from: 'bean_impression_attributes_i_sweet'
    select another_impression.i_bitter, from: 'bean_impression_attributes_i_bitter'
    fill_in 'bean_impression_attributes_i_comment', with: another_impression.i_comment
    click_button I18n.t('beans.form.register')
    expect(page).to have_content I18n.t('beans.flash.edited_bean')

    # delete
    click_on 'delete'
    expect(page).to have_content I18n.t('beans.delete_bean_link.are_you_sure?')

    click_on I18n.t('beans.delete_bean_link.delete')
    expect(page).to have_content I18n.t('beans.flash.deleted_bean')
  end
end
