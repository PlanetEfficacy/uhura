Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_ID"], ENV["GOOGLE_SECRET"], {
    :name => "google",
    :scope => ['contacts','drive','email','profile', 'plus.me', 'https://www.googleapis.com/auth/classroom.rosters'],
    # :prompt => "select_account",
    :prompt => "consent",
    :image_aspect_ratio => "square",
    :image_size => 32,
    :access_type => 'offline'
  }
end
