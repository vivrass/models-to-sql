module ModelsToSql
  class Climber
    
    def self.climb(model, output, baton = {})
      baton[:ignore_models] ||= []
      baton[:ignore_tables] ||= []
      baton[:dumped_ids] ||= Hash.new { |hsh,key| hsh[key] = Array.new }
      baton[:debug] ||= false
      baton[:level] ||= 0

      return if !model.class.respond_to?(:table_name)
      return if baton[:ignore_models].include?(model.class)
      return if baton[:ignore_tables].include?(model.class.table_name)
      return if baton[:dumped_ids][model.class].include?(model.id)
      
      baton[:dumped_ids][model.class] << model.id
      
      output << sql(model)
      STDERR << "LEVEL: #{baton[:level]} Copying #{model.class}:#{model.id}\n" if baton[:debug]

      model.class.reflect_on_all_associations.each do |assoc|
        assoc_value = model.send(assoc.name)
        if assoc_value
          unless assoc_value.is_a? Array
            leafs = [ assoc_value ]
          else
            leafs = assoc_value
          end

          leafs.each do |leaf|
            baton[:level] += 1
            climb(leaf, output, baton)
            baton[:level] -= 1
          end
        end
      end
    end

    def self.sql(model)
      
      include ActiveModel::AttributeMethods
      c = model.connection

      quoted_columns = []
      quoted_values = []

      if Rails.version.to_i >= 4
        attributes_with_values = model.send(:arel_attributes_with_values_for_create, model.attribute_names)
      else
        attributes_with_values = model.send(:arel_attributes_values, true, true)
      end

      attributes_with_values.each_pair do |key,value|
        quoted_columns << c.quote_column_name(key.name)
        quoted_values << c.quote(value)
      end

      "INSERT INTO #{model.class.quoted_table_name} (#{quoted_columns.join(', ')}) VALUES(#{quoted_values.join(', ')});\n"
    end

  end
end
