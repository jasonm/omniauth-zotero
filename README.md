# OmniAuth Zotero

This is the unofficial OmniAuth strategy for authenticating to Zotero. To
use it, you'll need to sign up for an OAuth Client Key and Secret
on the [Zotero Applications Page](https://www.zotero.org/oauth/apps).

You can then use the API key provided by this strategy to authenticate
against and use the
[Zotero Server API](https://www.zotero.org/support/dev/server_api/oauth).

Heavily inspired by Logan Lowell's
[OmniAuth-Mendeley](https://github.com/fractaloop/omniauth-mendeley) gem.

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-zotero'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-zotero

## Usage

First, use the OmniAuth Zotero middleware:

```ruby
# For Rack apps, in your config.ru
use OmniAuth::Builder do
  provider :zotero, ENV['ZOTERO_KEY'], ENV['ZOTERO_SECRET']
end

# For Rails apps, in config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :zotero, ENV['ZOTERO_KEY'], ENV['ZOTERO_SECRET']
end
```

Then, read the OmniAuth documentation on
[Integrating OmniAuth Into Your Application](https://github.com/intridea/omniauth#integrating-omniauth-into-your-application).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

See accompanying LICENSE file.
