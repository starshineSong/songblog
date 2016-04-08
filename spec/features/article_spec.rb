require 'rails_helper'
require 'spec_helper'
require 'faker'

describe 'ArticlesController' do

  it 'ArticlesList' do
    visit '/articles'
    expect(page).to have_content('Listing Articles')
  end

  it 'ArticlesNew' do
    visit '/articles/new'
    new_article = FactoryGirl.build(:article)
    within('#new_article') do
      fill_in 'article_title',with: new_article.title
      fill_in 'article_text',with: new_article.text
    end
    click_button 'Create Article'
    expect(page).to have_content('详情')

    click_link 'Back'
    expect(page).to have_content('Listing Articles')

    click_link 'Show'
    expect(page).to have_content('详情')

    click_link 'Back'
    expect(page).to have_content('Listing Articles')

    click_link 'Edit'
    within('#edit_article_1') do
      fill_in 'article_title',with: Faker::Name.name
      fill_in 'article_text',with: Faker::Name.name
    end
    click_button 'Update Article'
    expect(page).to have_content('详情')

    click_link 'Back'
    expect(page).to have_content('Listing Articles')

    click_link 'Destroy'
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('successfully destroyed')
  end


end