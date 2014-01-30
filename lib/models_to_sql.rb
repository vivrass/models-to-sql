require 'models_to_sql/array'
require 'models_to_sql/active_record'
require 'models_to_sql/climber'

ActiveRecord::Base.send(:include, ModelsToSql::ActiveRecord)
