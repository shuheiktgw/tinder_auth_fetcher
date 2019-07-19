module TinderAuthFetcher
  require 'selenium-webdriver'
  require 'webdrivers'

  URI = 'https://www.facebook.com/v2.6/dialog/oauth?redirect_uri=fb464891386855067%3A%2F%2Fauthorize%2F&scope=user_birthday%2Cuser_photos%2Cuser_education_history%2Cemail%2Cuser_relationship_details%2Cuser_friends%2Cuser_work_history%2Cuser_likes&response_type=token%2Csigned_request&client_id=464891386855067&ret=login&fallback_redirect_uri=221e1158-f2e9-1452-1a05-8983f99f7d6e&ext=1556057433&hash=Aea6jWwMP_tDMQ9y'

  def self.fetch_token(email, password)
    options = Selenium::WebDriver::Chrome::Options.new(
      prefs: { 'profile.default_content_setting_values.notifications': 2 }
    )

    driver = Selenium::WebDriver.for :chrome, options: options

    driver.navigate.to URI

    driver.find_element(:id, 'email').send_keys(email)
    driver.find_element(:id, 'pass').send_keys(password)
    driver.find_element(:id, 'loginbutton').click

    driver.find_element(:name, '__CONFIRM__').click

    driver.page_source.match(/access_token=(\w+)&data_access_expiration_time=/)[1]
  end
end
