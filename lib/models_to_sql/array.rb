class Array

  def to_sql(*anything)
    map do |leaf|
      leaf.to_sql(*anything)
    end
  end

end
