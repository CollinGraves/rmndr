web: bundle exec puma -t ${PUMA_MIN_THREADS:-2}:${PUMA_MAX_THREADS:-5} -p $PORT -e ${RACK_ENV:-development}
worker: rake jobs:work
