[![Gem Version](https://badge.fury.io/rb/annex-cms.png)](http://badge.fury.io/rb/annex-cms) [![Build Status](https://drone.io/github.com/unicorn/annex/status.png)](https://drone.io/github.com/unicorn/annex/latest) [![Code Climate](https://codeclimate.com/github/unicorn/annex.png)](https://codeclimate.com/github/unicorn/annex)

# Annex Gem for Rails 4.x

There are dozens of different Content Management Systems out in the wild, but none of them really work will with existing proprietary applications. Annex aims to remedy that by being an extremely minimal, inline editor that requires only installion and view calls for multilingual support as well as robust and dynamic Content Management.

## Installation
Include Annex in your Gemfile and Bundle:

`gem 'annex-cms'`

add the engine to routes.rb

`mount Annex::Engine => '/annex', :as => 'annex'`


## Assets
Annex relies on both custom styles and scripts in order to build the editor.
These assets can be customized or overridden in your application folder.

### Global Inclusion
For global inclusion, you can add the two assets to your application files:

`*= require annex` in application.css

`//= require annex` in application.js (after jquery)

### Auth Based Inclusion
In many instances, you'll want custom authentication logic to allow editing. By adding them to your layout, you will be able to check a role type or the like:

```ruby
- if current_user and current_user.is_admin?
  = stylesheet_link_tag "annex", media: "all", "data-turbolinks-track" => true
  = javascript_include_tag "annex", "data-turbolinks-track" => true
```

***Note***
You will need to enable a couple setting in `config/environments/production.rb` to get this to work with Heroku's assets:

```ruby
  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = true

  # Generate digests for assets URLs.
  config.assets.digest = true
```

## Settings and Installation
If you're using ActiveRecord, there is a migration file provided with the gem that will get you going.
Currently the gem only needs to know whether you want connect with ActiveRecord (default) or Mongoid in an initializer:

```ruby
Annex::config[:adapter] = :activerecord
```

## Using the Annex Helper
To add a block to a page, simple call the annex_block helper in a view:

`= annex_block :unique_identifier`

This will automatically store a record in the databese with a prefix of the route
comprised of locale_controller_action with a secondary lookup in the content column.
You can also set defaults in case the data doesn't yet exist:

`= annex_block :unique_identifier, default: 'this is my default text'`


## Licenses
The `annex` gem and source code is MIT-LICENSE. Please use at will, and contributions are very welcome!

[Redactor](http://imperavi.com/redactor/) is used for the WYSIWYG editor, and may me used freely for non-commercial websites. I'm saving up for an OEM license, and if you would like to be able to support this project for commercial use in the future, please take a minute to donate a couple bucks:

<a href='https://pledgie.com/campaigns/24130'><img alt='Click here to lend your support to: OEM License for Annex and make a donation at pledgie.com !' src='https://pledgie.com/campaigns/24130.png?skin_name=chrome' border='0' ></a>


If you're not sure that your use qualifies as non-commercial, please see the [License Agreement](http://redactorjs.com/download/).
