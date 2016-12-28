# shikigami / 式神
[![Gem Version](https://badge.fury.io/rb/shikigami.svg)](https://badge.fury.io/rb/shikigami)
[![Code Climate](https://codeclimate.com/github/jodeci/shikigami/badges/gpa.svg)](https://codeclimate.com/github/jodeci/shikigami)
[![Test Coverage](https://codeclimate.com/github/jodeci/shikigami/badges/coverage.svg)](https://codeclimate.com/github/jodeci/shikigami/coverage)
[![Build Status](https://travis-ci.org/jodeci/shikigami.svg?branch=master)](https://travis-ci.org/jodeci/shikigami)

*shikigami* is meant to make creating basic CRUD Rails apps as brain dead easy as possible.

## Installation

Add this line to your application's Gemfile:

```
gem "shikigami"
```

And then execute:

```
$ bundle install
```

*shikigami* utilizes the I18n library and you will need to have these information in your locale file:

```
zh-TW:
  success:
    create: 新建資料成功
    update: 修改資料成功
    destroy: 刪除資料成功

  actions:
    new: 新增
    edit: 修改
    show: 檢視
    destroy: 刪除

  confirm:
    destroy: 確認要刪除？

  warnings:
    no_data: 尚無資料
```

Or, just let *shikigami* generate the locale file for you:

```
$ rails generate shikigami:install
``` 

*shikigami* also assumes that you use [Kaminari](https://github.com/amatsuda/kaminari) for pagination and bootstrap for layout.

Tested with Rails 5 and Ruby 2.3.

## Usage

*Original credit goes to [@ryudoawaru](https://github.com/ryudoawaru). I've been using this almost everywhere, with some tweaks of my own, so I figured I'd might as well put together a gem.*

*shikigami* provides an abstract controller to handle CRUD actions in `Shikigami::BaseController`. Simply inherit your controllers from *shikigami*, specify the relevant `current_scope` and `resource_params`, and you're done. *shikigami* will do the remaining boring stuff for you.

```
# all set!
class BooksController < Shikigami::BaseController
  def current_scope
    Book
  end
  
  def resource_params
    parms.require(:book).permit(:title, :author)
  end
end
```

Then, in your view, just use `current_collection` or `current_object` to access your data.

```
# app/views/books/show.html.slim
h1 = current_object.title

# app/views/books/index.html.slim
- current_collection.each do |item|
  = item.title
```

Obviously, *shikigami* is only meant for the most basic CRUD Rails apps. If you need something more fancy, you shouldn't be using it :p

## View Helpers

### no\_data\_alert

Generates the following HTML:

```
# no_data_alert
<div class="alert alert-warning">尚無資料</div>
```

### bootstrap\_dropdown\_toggle

Generates the following HTML. `bs_dd_toggle` for short. Yeah, I'm lazy.

```
# bootstrap_dropdown_toggle("something")
<a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">something<span class="caret"></span></a>
```

### bootstrap\_button

Generates a bootstrap button style link. `bs_btn`
 for short.
 
```
# bs_btn(:edit, "#")
<a class="btn btn-xs btn-warning" href="#">修改</a>
```

By default, *shikigami* generated buttons will be sized as `.btn-xs`. Unless specified otherwise, it will use `.btn-info` for `show` actions, `.btn-warning` for `edit` actions, and `.btn-danger` for `destroy` actions. 

You can also pass in methods and confirmation:

```
# bs_btn(:destroy, "#", method: :delete, confirm: true)
<a class="btn btn-xs btn-danger" data-confirm="確認要刪除？" rel="nofollow" data-method="delete" href="#">刪除</a>
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
