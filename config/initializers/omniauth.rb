Rails.application.config.middleware.use OmniAuth::Builder do

  scope = ["profile",
           "email",
           "https://www.googleapis.com/auth/plus.login",
           "https://www.googleapis.com/auth/drive",
           "https://www.googleapis.com/auth/contacts.readonly",
           "https://www.googleapis.com/auth/classroom.rosters.readonly"]

  provider :google_oauth2, ENV["GOOGLE_ID"], ENV["GOOGLE_SECRET"], {
    :name => "google",
    :scope => scope,
    :prompt => "consent",
    :image_aspect_ratio => "square",
    :image_size => 50,
    :access_type => 'offline'
  }
end
