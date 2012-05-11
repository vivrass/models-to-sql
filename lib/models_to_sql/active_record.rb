module ModelsToSql
  module ActiveRecord

    def to_sql_insert(options = {})
      self.class.cache do
        ModelsToSql::Climber.climb(self, options.delete(:out) || STDOUT, options)
      end
    end
  
  end
end
