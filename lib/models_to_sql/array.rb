class Array

  def to_sql_insert(*anything)
    map do |leaf|
      leaf.to_sql_insert(*anything)
    end
  end

end
