client = Google::Cloud::Pubsub.new(ENV["GOOGLE_CLOUD_PROJECT"])

PUBSUB_CLIENT = client.topic(ENV["GOOGLE_CLOUD_PUBSUB_TOPIC"])
