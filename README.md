
AcedRails
=========

This gem is a fork from [ffloyd/aced_rails](https://github.com/ffloyd/aced_rails)  It provide generator and helpers for using [Ajax.org ACE Editor](http://ajaxorg.github.com/ace/) in Rails applications. 

Changes from [ffloyd/aced_rails](https://github.com/ffloyd/aced_rails) include:

* updateds to latest assets from [ajaxorg/ace](https://github.com/ajaxorg/ace)
* added initializer support for extensions and addons

Installation
------------

*Rails 3.1+ is required.*

Add this line to your application's Gemfile:

    gem 'aced_rails', :git => 'git://github.com/sashap/aced_rails.git'

Install the gem:

    $ bundle

Generate config file (config/initializers/aced_rails.rb):

    $ rails g aced_rails:install 

Add aced_tag to the application head after the javascript_include_tag lines: 

```ruby
  <%= javascript_include_tag "application" %>
  <%= aced_tag %>
```

Configuration
-------------

Config file (config/initializers/aced_rails.rb) is simple one and well commented.  Edit config file to add/remove loading of corresponding javascript files for Ace themes, modes, and extensions:

```ruby
  config.themes = [:twilight]
  config.modes = [:ruby, :sh, :textile, :javascript, :python]
  config.extensions = [:searchbox, :textarea]
  config.addons = [:bookmarklet]
```

Usage
-----

The most important feature is jQuery plugin:

* init example. Convert div to ACE editor with specified theme and mode

```javascript
  $(target_div).aced('init', {theme: 'twilight', mode: 'textile'});
```

* conf example (it use same options, but requires already initialized div):

```javascript
  $(aced_div).aced('conf', {content: 'Awesome!'});
```

* there are no necessary options for init or conf. The complete list of available options:

  * *id* - set element id (only for init)
  * *theme* - set theme
  * *mode* - set mode
  * *content* - set content of editor
  * *on_change* - callback for change event (ACE API's callback, nothing special)

* textarea magick - aced_ta (have only 'init' method). It hides textarea, create "aced div" and set callback for content synchronization:

```javascript
$('#post_body').aced_ta('init', {class: 'span8', theme: 'twilight', mode: 'textile', rows_to_px: 15, normalize: 'yes'});
```

* additional options for aced_ta:
  
  * *class* - list of classes for div
  * *style* - pure css for div
  * *rows_to_px* - add height css option to style with value based on given number and rows textarea attribute
  * *normailze* - add "position: relative; margin-left: 0;" to style (useful for twitter bootstrap forms)

* aced and aced_ta uses jQuery.data feature for store editor object:

```javascript
var ace_editor_session = $(aced_div).data('aced_editor').getSession();
```




Original Docs
-------------

More documentation can be found on [ffloyd/aced_rails](https://github.com/ffloyd/aced_rails)
