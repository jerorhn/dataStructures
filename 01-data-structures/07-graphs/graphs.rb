require_relative 'node.rb'

class Kevin_Bacon
  def initialize
    @nodes = []
  end

  def find_kevin_bacon(start)
    start.film_actor_hash.each do |actor|
      if actor == 'Kevin_Bacon'
        return start
      end
    end
    # FOR each node that start connects to
    #   IF the node is closer to end than start THEN
    #     RETURN start + CALL find_kevin_bacon(node)
    #   END IF
    # END FOR
  end
end
