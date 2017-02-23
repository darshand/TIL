## We can generate controllers without assets tests or view templates while generating controllers.
## This will be helpfull when generating controllers for api controllers.

`rails g controller v2/[NAME] --no-helper --no-assets --no-template-engine --no-test-framework`

> The above additional parameters skips the helper, assets, test and view default templates while generating controllers by default.

