# ActiveModel Better Errors

[![Gem Version](https://badge.fury.io/rb/active_model-better_errors.png)](http://badge.fury.io/rb/active_model-better_errors)
[![Build Status](https://travis-ci.org/aq1018/active_model-better_errors.png?branch=master)](https://travis-ci.org/aq1018/active_model-better_errors)
[![Dependency Status](https://gemnasium.com/aq1018/active_model-better_errors.png)](https://gemnasium.com/aq1018/active_model-better_errors)
[![Code Climate](https://codeclimate.com/github/aq1018/active_model-better_errors.png)](https://codeclimate.com/github/aq1018/active_model-better_errors)

  - [![Version](https://badge.fury.io/rb/active_model-better_errors.png)](https://rubygems.org/gems/active_model-better_errors)
  - [![Climate](https://codeclimate.com/github/aq1018/active_model-better_errors.png)](https://codeclimate.com/github/aq1018/active_model-better_errors)
  - [![Build](http://img.shields.io/travis-ci/aq1018/active_model-better_errors.png)](https://travis-ci.org/aq1018/active_model-better_errors)
  - [![Dependencies](https://gemnasium.com/aq1018/active_model-better_errors.png)](https://gemnasium.com/aq1018/active_model-better_errors)
  - [![Coverage](http://img.shields.io/coveralls/aq1018/active_model-better_errors.png)](https://coveralls.io/r/aq1018/active_model-better_errors)
  - [![Gittip](http://img.shields.io/gittip/aq1018.png)](https://www.gittip.com/aq1018/)
  - [![License](http://img.shields.io/license/MIT.png?color=green)](http://opensource.org/licenses/MIT)

`active_model-better_errors` is a `ActiveModel::Errors` compatible library to help you customize the presentation of your error messages.

In `ActiveModel::Errors` when an error is added it is pre-translated into human readable string. However, this becomes less ideal when output error messages in JSON or XML in your API. Most of the times we want error codes instead of human readable strings. This will allow API consumers to translate them in their own application and provide more flexibility for your API.


Using
=====

`active_model-better_errors` works by separating the concerns of error message storage and presentation. `ActiveModel::Errors` really handles four tasks in a single class:

  * error data storage
  * presenting human readable errors using `#full_messages`
  * presenting errors in Array / XML format with `#to_a` and `#to_xml`
  * presenting errors in Hash / JSON format with `#to_hash` and `#as_json`

This gem separates these concerns and allows users to plugin various reporters for different presentation needs.

By default, `active_model-better_errors` is a drop-in replacement for `ActiveModel::Errors` and will mostly function without modifications. This is because the default reporters are set like the following:

``` ruby
ActiveModel::ErrorCollecting.set_reporter :message, :human
ActiveModel::ErrorCollecting.set_reporter :array, :human
ActiveModel::ErrorCollecting.set_reporter :hash, :human
```

If you want to output API friendly JSON / XML by default, you can use the following config.

``` ruby
ActiveModel::ErrorCollecting.set_reporter :message, :human
ActiveModel::ErrorCollecting.set_reporter :array, :machine
ActiveModel::ErrorCollecting.set_reporter :hash, :machine
```

**Note**: The configurations above determines *default* reporters to use, you can always switch to any reporters you want during runtime by invoking `errors.set_reporter`


``` ruby
user.errors # returns an instance of ActiveModel::ErrorCollecting::Errors

# Use MachineArrayReporter to output API friendly error messages
user.errors.set_reporter(:array, :machine)
user.errors.to_a   # API Friendly
user.errors.to_xml # API Friendly


# Use HumanArrayReporter to output Human friendly error messages.
# This is ActiveModel::Errors behavior
user.errors.set_reporter(:array, :human)
user.errors.to_a   # Human Friendly
user.errors.to_xml # Human Friendly


# Use MachineHashReporter to output API friendly error messages
user.errors.set_reporter(:hash, :machine)
user.errors.to_hash # API Friendly
user.errors.as_json # API Friendly
user.errors.to_json # API Friendly


# Use HumanHashReporter to output Human friendly error messages.
# This is ActiveModel::Errors behavior
user.errors.set_reporter(:hash, :human)
user.errors.to_hash # Human Friendly
user.errors.as_json # Human Friendly
user.errors.to_json # Human Friendly


# Use MyHashReporter to output Human friendly error messages.
# This is ActiveModel::Errors behavior
user.errors.set_reporter(:hash, MyHashReporter)
user.errors.to_hash # custom behavior
user.errors.as_json # custom behavior
user.errors.to_json # custom behavior
```


Reporters
=========

This library creates three types of reporters to take care of
some presentation aspects of `ActiveModel::Errors`, and they are:


**Message Reporters**

This is responsible for handling the following methods in `ActiveModel::Errors`

  * `#full_messages`
  * `#full_message`
  * `#generate_message`

Due to the conventional use of these methods, they are mostly intended for human consumption.

This library implements the following reporters of this type:

  * `HumanMessageReporter`


**Array Reporters**

This is responsible for handling the following methods in `ActiveModel::Errors`

  * `#to_a`

This library implements the following reporters of this type:

  * `HumanArrayReporter`
  * `MachineArrayReporter`


**Hash Reporters**

This is responsible for handling the following methods in `ActiveModel::Errors`

  * `#to_hash`

This library implements the following reporters of this type:

  * `HumanHashReporter`
  * `MachineHashReporter`


**Creating Custom Reporters**

Creating a custom reporter is easy. Here is an example to create a hash reporter

```ruby
class MyHashReporter < ActiveModel::ErrorCollecting::HashReporter
  def to_hash
    # you have access to #collection and #base
  end
end

# set it to use it.
ActiveModel::ErrorCollecting.set_reporter :hash, MyHashReporter
```


Installing
==========

Add this line to your application's Gemfile:

    gem "active_model-better_errors"

And then execute:

    $ bundle

Or install it yourself with:

    $ gem install active_model-better_errors


Contributing
============

  1. Fork it
  2. Create your feature branch (`git checkout -b my-new-feature`)
  3. Commit your changes (`git commit -am 'Add some feature'`)
  4. Push to the branch (`git push origin my-new-feature`)
  5. Create new Pull Request

Licensing
=========

Copyright (c) 2013 Aaron Qian

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
