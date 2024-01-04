# Must have `sentry-cli` installed globally
# Following variables must be passed in

SENTRY_ORG=anasystem
SENTRY_PROJECT=frontend-monitoring-zs
SENTRY_URL=http://192.168.12.245:9000
export SENTRY_AUTH_TOKEN=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

REACT_APP_RELEASE_VERSION=`sentry-cli releases propose-version`

# setup_release: $(info ************ RELEASE VERSIOIN **********)
setup_release: create_release upload_sourcemaps

create_release:
	sentry-cli --url $(SENTRY_URL) releases -o $(SENTRY_ORG) new -p $(SENTRY_PROJECT) $(REACT_APP_RELEASE_VERSION)
upload_sourcemaps:
	sentry-cli --url $(SENTRY_URL) releases -o $(SENTRY_ORG) -p $(SENTRY_PROJECT) files $(REACT_APP_RELEASE_VERSION) upload-sourcemaps --rewrite --url-prefix "~/static/js" --validate build/static/js