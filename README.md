# shikigami / 式神

Work in progress. View helpers to make it even more easier to create basic CRUD apps with bootstrap.

## Installation

Add this line to your application's Gemfile:

```
gem "shikigami"
```

And then execute:

    $ bundle
    
## locale file

I should make a generator for this but in the meantime, you will need to have these information in your locale file:

```
zh-TW:
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


## Usage

### no\_data\_alert

Generates the following HTML:

```
# no_data_alert()
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

By default, shikigami generated buttons will be sized as `.btn-xs`. Unless specified otherwise, it will use `.btn-info` for `show` actions, `.btn-warning` for `edit` actions, and `.btn-danger` for `destroy` actions. 

You can also pass in methods and confirmation:

```
# bs_btn(:destroy, "#", method: :delete, confirm: true)
<a class="btn btn-xs btn-danger" data-confirm="確認要刪除？" rel="nofollow" data-method="delete" href="#">刪除</a>
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

