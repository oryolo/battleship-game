class Ship
  attr_reader :type, :size, :orientation

  def initialize(type, size)
    @type = type
    @size = size
    @orientation = ['horizontal', 'vertical'].sample
  end
end