# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bookr_session',
  :secret      => '5eb2b9c4a2bae244a8cf2c019c08848cba1866c40e03c9cac68d5eaa8d6406fd709c95a2bfcb270367ff3e0caa7530845853192a1cd80c68fe8c8b8bc6ffb922'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
