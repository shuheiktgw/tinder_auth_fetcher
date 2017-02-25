require 'tinder_auth_fetcher/version'
require 'mechanize'

module TinderAuthFetcher
  USER_AGENT = 'Mozilla/5.0 (Linux; U; en-gb; KFTHWI Build/JDQ39) AppleWebKit/535.19 (KHTML, like Gecko) Silk/3.16 Safari/535.19'
  URI = 'https://www.facebook.com/v2.6/dialog/oauth?redirect_uri=fb464891386855067%3A%2F%2Fauthorize%2F&display=touch&state=%7B%22challenge%22%3A%22IUUkEUqIGud332lfu%252BMJhxL4Wlc%253D%22%2C%220_auth_logger_id%22%3A%2230F06532-A1B9-4B10-BB28-B29956C71AB1%22%2C%22com.facebook.sdk_client_state%22%3Atrue%2C%223_method%22%3A%22sfvc_auth%22%7D&scope=user_birthday%2Cuser_photos%2Cuser_education_history%2Cemail%2Cuser_relationship_details%2Cuser_friends%2Cuser_work_history%2Cuser_likes&response_type=token%2Csigned_request&default_audience=friends&return_scopes=true&auth_type=rerequest&client_id=464891386855067&ret=login&sdk=ios&logger_id=30F06532-A1B9-4B10-BB28-B29956C71AB1&ext=1470840777&hash=AeZqkIcf-NEW6vBd'

  def self.fetch_token(email, password)
    # Login to the page
    logged_in = login(email, password)

    # Click OK
    confirmed = confirm(logged_in)

    # Retrieve token
    confirmed.content.match(/access_token=(\w+)&expires_in=/)[1]
  end

  private

  def prepare_agent
    agent = Mechanize.new
    agent.user_agent = USER_AGENT
    agent
  end

  def login(email, password)
    agent = prepare_agent
    page = agent.get(URI)

    f = page.forms[0]
    f.field_with(name: 'email').value = email
    f.field_with(name: 'pass').value = password

    res = agent.submit f

    if res.uri.path == '/login/'
      raise 'Facebook login failed. Check if you passed correct email and password'
    end

    res
  end

  def confirm(logged_in)
    confirm = logged_in.forms[0]
    confirm.click_button(confirm.button_with(name: '__CONFIRM__'))
  end
end
