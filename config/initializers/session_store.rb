# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_training_session',
  :secret      => '949b3ea9c2df67f1174a48b214220843ab805082ee99faa6c185a2c36d944bf584a7412ce8e64fa8d8d5ce5cbaa2fb87b256a3cfc88b94a2780c2798ba511768'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
