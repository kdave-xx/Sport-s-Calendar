# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sports_session',
  :secret      => '57d02440b0959e54f4daede02e8ecfe5cff387783583203e1efd1ba964d2a4d1a85bd79318391e2a739b0416ced24fed9a6692ecff303010dcaa748149669e4b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
