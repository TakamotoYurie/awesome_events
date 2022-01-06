Rails.application.config.middleware.use Omniauth:Builder do
  if Rails.env.development? || Rails.env.test?
    provider :github, "ba673509b090616b4b54", "7f961b5946242dd47221b8873ecb784bf1f59d58"
  else
    provider :github,
    Rails.application.credential.github[:client_id],
    Rails.application.credential.github[:client_secret]
  end
end