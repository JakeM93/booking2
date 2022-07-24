class DevelopmentDebugging
  def self.the_array
    @@debug ||= []
  end

  def self.add element
    if @@debug
      @@debug << element
    else
      @@debug = [element]
    end
  end
end