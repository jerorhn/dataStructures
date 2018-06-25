include RSpec

require_relative 'binary_heap'

RSpec.describe BinaryHeap, type: Class do
  let (:root) { Node.new("Inception", 86) }

  let (:heap) { BinaryHeap.new(root) }
  let (:heap_array) { heap.heap }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }
  let (:matrix) { Node.new("The Matrix", 87) }

  describe "#insert(data)" do
    it "properly inserts a new node as last child" do
      heap.insert(root, district)
      expect(heap_array[1].title).to eq "District 9"
    end

    it "properly inserts a new node as a middle child" do
      heap.insert(root, martian)
      heap.insert(root, district)
      expect(heap_array[1].title).to eq "District 9"
      expect(heap_array[2].title).to eq "The Martian"
    end

    it "properly inserts a new node before root" do
      heap.insert(root, pacific_rim)
      expect(heap_array[0].title).to eq "Pacific Rim"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      heap.insert(root, empire)
      heap.insert(root, mad_max_2)
      expect(heap.find(root, nil)).to eq nil
    end

    it "properly finds a root" do
      heap.insert(root, pacific_rim)
      expect(heap.find(root, root.title).title).to eq "Inception"
    end

    it "properly finds last node" do
      heap.insert(root, braveheart)
      heap.insert(root, hope)
      expect(heap.find(root, hope.title).title).to eq "Star Wars: A New Hope"
    end

    it "properly finds a middle node" do
      heap.insert(root, hope)
      heap.insert(root, matrix)
      expect(heap.find(root, matrix.title).title).to eq "The Matrix"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(heap.delete(root, nil)).to eq nil
    end

    it "properly deletes a root" do
      heap.insert(root, hope)
      heap.delete(root, root.title)
      expect(heap.find(root, root.title)).to be_nil
    end

    it "properly deletes last node" do
      heap.insert(root, martian)
      heap.insert(root, empire)
      heap.delete(root, empire.title)
      expect(heap.find(root, empire.title)).to be_nil
    end

    it "properly deletes a middle node" do
      heap.insert(root, district)
      heap.insert(root, hope)
      heap.delete(root, district.title)
      expect(heap.find(root, district.title)).to be_nil
    end

    it "properly deletes a first node" do
      heap.insert(root, braveheart)
      heap.insert(root, pacific_rim)
      heap.delete(root, pacific_rim.title)
      expect(heap.find(root, pacific_rim.title)).to be_nil
    end
  end

  describe "#print" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nInception: 86\nThe Matrix: 87\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
       heap.insert(root, pacific_rim)
       heap.insert(root, braveheart)
       heap.insert(root, jedi)
       heap.insert(root, matrix)
       heap.insert(root, district)
       heap.insert(root, shawshank)
       heap.insert(root, martian)
       heap.insert(root, hope)
       heap.insert(root, empire)
       heap.insert(root, mad_max_2)
       expect { heap.print }.to output(expected_output).to_stdout
     }

     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nInception: 86\nThe Matrix: 87\nDistrict 9: 90\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nMad Max 2: The Road Warrior: 98\n"
       heap.insert(root, mad_max_2)
       heap.insert(root, district)
       heap.insert(root, shawshank)
       heap.insert(root, braveheart)
       heap.insert(root, pacific_rim)
       heap.insert(root, matrix)
       heap.insert(root, martian)
       heap.insert(root, jedi)
       heap.insert(root, empire)
       heap.insert(root, hope)
       expect { heap.print }.to output(expected_output).to_stdout
     }
  end
end
