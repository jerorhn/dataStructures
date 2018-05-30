# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
    @list = self.members
  end

  def join(person)
    @list.push(person)
  end

  def leave(person)
    @list.delete(person)
  end

  def front
    @list[0]
  end

  def middle
    @list[(@list.length/2).floor]
  end

  def back
    @list[-1]
  end

  def search(person)
    if @list.find_index(person) != nil
      return person
    end
  end

  private

  def index(person)
  end

end
