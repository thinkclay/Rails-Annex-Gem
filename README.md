[![Gem Version](https://badge.fury.io/rb/annex-cms.png)](http://badge.fury.io/rb/annex-cms) [![Build Status](https://drone.io/github.com/unicorn/annex/status.png)](https://drone.io/github.com/unicorn/annex/latest) [![Code Climate](https://codeclimate.com/github/unicorn/annex.png)](https://codeclimate.com/github/unicorn/annex)

# Annex Gem for Rails 4.x

There are dozens of different Content Management Systems out in the wild, but none of them really work will with existing proprietary applications. Annex aims to remedy that by being an extremely minimal, inline editor that requires only installion and view calls for multilingual support as well as robust and dynamic Content Management.

## Installation
Include Annex in your Gemfile and Bundle:

`gem 'annex'`

add the engine to routes.rb

`mount Annex::Engine => '/annex', :as => 'annex'`

For global inclusion, you can add the two assets to your application files:

`*= require annex` in application.css

`//= require annex` in application.js (after jquery)

Or, you can do some authentication logic by adding them to your layout, thus being able to check a role type or the like:

```ruby
- if current_user and current_user.is_admin?
  = stylesheet_link_tag "annex", media: "all", "data-turbolinks-track" => true
  = javascript_include_tag "annex", "data-turbolinks-track" => true
```

To add a block to a page, simple call the annex_block helper in a view:

`= annex_block :unique_identifier`

This will automatically store a record in MongoDB (only database it supports at the moment) with a prefix of the route comprised of locale_controller_action with a secondary lookup in the content column.


## Licenses
The `annex` gem and source code is MIT-LICENSE. Please use at will, and contributions are very welcome!

[Redactor](http://imperavi.com/redactor/) is used for the WYSIWYG editor, and may me used freely for non-commercial websites. I'm saving up for an OEM license, and if you would like to be able to support this project for commercial use in the future, please take a minute to donate a couple bucks:

<a href='https://pledgie.com/campaigns/24130'><img alt='Click here to lend your support to: OEM License for Annex and make a donation at pledgie.com !' src='https://pledgie.com/campaigns/24130.png?skin_name=chrome' border='0' ></a>


If you're not sure that your use qualifies as non-commercial, please see the [License Agreement](http://redactorjs.com/download/).
