include RSpec

require_relative 'graphs'
require_relative 'node'
require_relative 'film'

RSpec.describe Graphs, type: Class do
  let (:bacon) { Graphs.new }

  let (:ross_bagley) { Node.new('Ross Bagley') }
  let (:mary_kate_olsen) { Node.new('Mary-Kate Olsen') }
  let (:reba_mcIntire) { Node.new('Reba McIntire') }
  let (:raven_symone) { Node.new('Raven-Symone') }
  let (:whoopi_goldberg) { Node.new('Whoopi Goldberg') }
  let (:blake_mcIver_ewing) { Node.new('Blake McIver Ewing') }

  let (:tony_genaro) { Node.new('Tony Genaro') }
  let (:kevin_bacon) { Node.new('Kevin Bacon') }
  let (:finn_carter) { Node.new('Finn Carter') }
  let (:ariana_richards) { Node.new('Ariana Richards') }
  let (:richard_marcus) { Node.new('Richard Marcus') }

  let (:other_actor) { Node.new('Other Actor')}

  def get_hashes
    little_rascals = Film.new("The Little Rascals", [ross_bagley, mary_kate_olsen, reba_mcIntire, raven_symone, whoopi_goldberg, blake_mcIver_ewing])

    tremors = Film.new("Tremors", [tony_genaro, kevin_bacon, reba_mcIntire, finn_carter, ariana_richards, richard_marcus])

    ross_bagley.film_actor_hash[little_rascals.title] = little_rascals.actors
    mary_kate_olsen.film_actor_hash[little_rascals.title] = little_rascals.actors
    raven_symone.film_actor_hash[little_rascals.title] = little_rascals.actors
    whoopi_goldberg.film_actor_hash[little_rascals.title] = little_rascals.actors
    blake_mcIver_ewing.film_actor_hash[little_rascals.title] = little_rascals.actors
    reba_mcIntire.film_actor_hash[little_rascals.title] = little_rascals.actors

    reba_mcIntire.film_actor_hash[tremors.title] = tremors.actors
    tony_genaro.film_actor_hash[tremors.title] = tremors.actors
    kevin_bacon.film_actor_hash[tremors.title] = tremors.actors
    finn_carter.film_actor_hash[tremors.title] = tremors.actors
    ariana_richards.film_actor_hash[tremors.title] = tremors.actors
    richard_marcus.film_actor_hash[tremors.title] = tremors.actors
  end


  describe "#find_kevin_bacon(start)" do
    it "properly connects an array of one film title" do
      get_hashes
      expect(bacon.find_kevin_bacon(finn_carter)).to eq ["Tremors"]
    end

    it "properly connects an array of two film title" do
      get_hashes
      expect(bacon.find_kevin_bacon(whoopi_goldberg)).to eq ["The Little Rascals", "Tremors"]
    end

    it "handles nil gracefully" do
      get_hashes
      expect(bacon.find_kevin_bacon(other_actor)).to eq "Can't find connection"
    end
  end
end
