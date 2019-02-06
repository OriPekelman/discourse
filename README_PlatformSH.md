# Running Discourse on Platform.sh

** CAVEAT **

* The `rake assets:precompile` task in the post-deploy hook will fail on small containers. **You can not run this in a development plan.**

Clone this repo and push to platform.sh. Tada.

Because we are not working on master in order to push this to platform.sh git server you can use:

```git push platform platform_sh:master```

Or merge the changes to your master branch.

To finish off the installation  you should set the developer email address

```
platform vset -emaster env:DISCOURSE_DEVELOPER_EMAILS myemail@example.com
```
## Plugins

To show off, we also include four very useful plugins

* discourse-oauth2-basic
* procourse-static-pages
* procourse-custom-homepage
* discourse-chat-integration


Most everything has been tested to be working but I will be happy to get feedback. Until we get network-storage mounts for workers putting worker in main container

## Changes to upstream
Changes we have made to the default upstream repo:

add 

```
gem 'platform_sh_rails'
```

to the Gemfile. I manually edited the `Gemfile.lock` because currently running `bundle update` breaks the installation.

add 
````
require 'platform_sh_rails'
````
to `application.rb`

create `config/discourse.conf` and remove it from `.gitignore`
create `.environment` where most of our config lives.


Add `.platform.app.yaml` and `.platform/routes.yaml` and  `.platform/services.yaml`

Created `Procfile_platform_sh`

## On first run
`platform ssh` and `bundle exec rake admin:create`
