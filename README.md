Introduction
---------------
Models to SQL Rails is a gem that allows you to dump ActiveRecord models graphs back into SQL or Rails fixtures format. With this gem you can easily convert a model or an array of models to a script like:
```sql
INSERT INTO modelName ('title','description') values ('Awesome Title', 'Wow, amaze description, much doge.');
```
This was just a example, this is a powerful and simple gem that can solve a lot of problems.

Usage
---------------
If you want use this gem in your project, you must add the following line to your `gemfile`:
```ruby
# If you want the most recent version:
gem 'models-to-sql-rails', :git => 'git://github.com/paladini/models-to-sql-rails.git'

# If you want the most stable version:
gem "models-to-sql-rails", "~> 1.0.3"
```
Then, you must open your terminal (Ctrl+Alt+T) and run the following command on your project root path:
```shell
bundle install
```
Now you're ready to start coding - easy, no?

Examples
--------------

Imagine that you have a scenario like that:

```ruby
require 'models_to_sql'

items = []
for i in 0..10
  items << Item.new(
      :name => generate_random_name(), 
      :description => generate_random_description(),
      :url => generate_random_url(),
      :type => "Goods",
      :category => "Electronics",
      :image_url => generate_random_image_url()
    )
end

###################################
#                                 #
#   Now let's play with our gem   #
#                                 #
###################################

items.to_sql_insert
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('UKlRBjdsyzLtjCL', 'GWpDhkVtkUHkazW', 'CGeCMJjTQGPFUbc', 'Goods', 'Electronics', 'kQWPeRytZAedVnF');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('UbOwdYzzFAKckNF', 'nlrMddCWRkYznBH', 'HOdGfDQBHmxSvSW', 'Goods', 'Electronics', 'PtWCKyhxrMFZVJd');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('NvQEUPVgKrPPaQh', 'uTPhqUvVTClimXA', 'HcTtNNoDjncnAIN', 'Goods', 'Electronics', 'LvtpaxTlLWblyar');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('GXSujkenwzvUqcS', 'QRjnvJROfZVSVEj', 'JoGNZMrjmUFlqVM', 'Goods', 'Electronics', 'yVJxiNEWFhQJbKv');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('gtJRWGAFOAvPzMa', 'TOFcwXlFxlLroTo', 'IlNmsRvShgbYace', 'Goods', 'Electronics', 'yLIBqYQjVIBeRcB');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('dUMiXZOzASvMyAv', 'nNuTUCjRsxNNoUU', 'qumOEoEpwGrJcjA', 'Goods', 'Electronics', 'PwbjaGayRZdwlKv');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('heuqrYERTtdUfgS', 'ZYckUtadljKbTBA', 'iFwqJYbqYYgEJNv', 'Goods', 'Electronics', 'BHHOXSFORpDsZBU');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('jFjywdyxTWrWrvC', 'MaJfdgHSENuHkrW', 'hnRJJwsSKHYCnvo', 'Goods', 'Electronics', 'fkKuTpgmvCYEzOK');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('JOIlNUFUVcMtQrP', 'PjLMkYvyFYGlRlr', 'MHucPxQxylqLQia', 'Goods', 'Electronics', 'quWbZUHSXwLvClY');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('UxtBOSKroxWtShX', 'ORVtVgfCTonQIZH', 'SjWgwuZBxLLHKCe', 'Goods', 'Electronics', 'drOiSxLZAkFtbCW');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('juAiBiHnFybnjlL', 'ouDFQXnSkRIMQaR', 'hgifUygkuXAWPLp', 'Goods', 'Electronics', 'dKVCzaOCJwmxIim');

items[0].to_sql_insert
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('UKlRBjdsyzLtjCL', 'GWpDhkVtkUHkazW', 'CGeCMJjTQGPFUbc', 'Goods', 'Electronics', 'kQWPeRytZAedVnF');

items.each do |item|
   item.to_sql_insert
end
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('UKlRBjdsyzLtjCL', 'GWpDhkVtkUHkazW', 'CGeCMJjTQGPFUbc', 'Goods', 'Electronics', 'kQWPeRytZAedVnF');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('UbOwdYzzFAKckNF', 'nlrMddCWRkYznBH', 'HOdGfDQBHmxSvSW', 'Goods', 'Electronics', 'PtWCKyhxrMFZVJd');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('NvQEUPVgKrPPaQh', 'uTPhqUvVTClimXA', 'HcTtNNoDjncnAIN', 'Goods', 'Electronics', 'LvtpaxTlLWblyar');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('GXSujkenwzvUqcS', 'QRjnvJROfZVSVEj', 'JoGNZMrjmUFlqVM', 'Goods', 'Electronics', 'yVJxiNEWFhQJbKv');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('gtJRWGAFOAvPzMa', 'TOFcwXlFxlLroTo', 'IlNmsRvShgbYace', 'Goods', 'Electronics', 'yLIBqYQjVIBeRcB');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('dUMiXZOzASvMyAv', 'nNuTUCjRsxNNoUU', 'qumOEoEpwGrJcjA', 'Goods', 'Electronics', 'PwbjaGayRZdwlKv');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('heuqrYERTtdUfgS', 'ZYckUtadljKbTBA', 'iFwqJYbqYYgEJNv', 'Goods', 'Electronics', 'BHHOXSFORpDsZBU');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('jFjywdyxTWrWrvC', 'MaJfdgHSENuHkrW', 'hnRJJwsSKHYCnvo', 'Goods', 'Electronics', 'fkKuTpgmvCYEzOK');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('JOIlNUFUVcMtQrP', 'PjLMkYvyFYGlRlr', 'MHucPxQxylqLQia', 'Goods', 'Electronics', 'quWbZUHSXwLvClY');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('UxtBOSKroxWtShX', 'ORVtVgfCTonQIZH', 'SjWgwuZBxLLHKCe', 'Goods', 'Electronics', 'drOiSxLZAkFtbCW');
# => INSERT INTO "items" ("name", "description", "url", "type", "category", "image_url") VALUES('juAiBiHnFybnjlL', 'ouDFQXnSkRIMQaR', 'hgifUygkuXAWPLp', 'Goods', 'Electronics', 'dKVCzaOCJwmxIim');

```

Simple? If have any issue or problem, [talk to us now](https://github.com/vivrass/models-to-sql/issues).

Original documentation
--------------

Original README from this [outdated gem](https://github.com/dsabanin/models-to-sql-rails-plugin). Have some useful informations that we don't have time to describe here.

After installation, each AR model has to_sql method that can take following options:

  :ignore_associations_for - do not dump associations with specified models. (default: empty)
  :ignore_models - do not dump specified models. Array of ruby Class objects is used. (default: empty)
  :ignore_tables - do not dump specified tables (default: empty)
  :debug - debugging mode (default: false)
  
  
Contribute
-------------

If you do like to contribute to our project, please feel free to Fork our project or talk with us by [creating a new issue](https://github.com/vivrass/models-to-sql/issues/new). Rails 3.2 port by [Martin Provencher](https://github.com/vivrass) and Rails 4.0 port + documentation by [Fernando Paladini](https://github.com/paladini).

