# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gestor_session',
  :secret      => 'a63334d7a99754e08b27fcdb06bb3bce19066485b9fac2dd8a229f7069a9d4f19b14dbb161e541b8910987c684dd935c8294d896429992db386e89b4220c8f78'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
