workers Integer(ENV.fetch("PUMA_WORKERS", 3))
threads Integer(ENV.fetch("MIN_THREADS", "1")), Integer(ENV.fetch("MAX_THREADS", 16))

preload_app!

rackup DefaultRackup
environment ENV.fetch("RACK_ENV", "development")
