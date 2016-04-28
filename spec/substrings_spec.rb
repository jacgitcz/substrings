require_relative "../substrings"

describe "#substrings"  do
	before(:all) do
		@dict = ["below","down","go","going","horn","how","howdy",
			    "it","i","low","own","part","partner","sit"]
	end

	it "returns an empty hash for no match" do
		expect(substrings("", @dict)).to eq({})
		expect(substrings("scooter",@dict)).to eq({})
	end

	it "finds substrings in single words" do
		expect(substrings("below",@dict)).to eq({"below"=>1, "low"=>1})
		expect(substrings("downside",@dict)).to eq({"down"=>1, "i"=>1, "own"=>1})
		expect(substrings("ongoing",@dict)).to eq({"go"=>1, "going"=>1, "i"=>1})
	end

	it "is not case sensitive" do
		expect(substrings("THORNY",@dict)).to eq({"horn"=>1})
		expect(substrings("SHowDoWN",@dict)).to eq({"how"=>1,"down"=>1,"own"=>1})
	end

	it "finds substrings in multiword strings with punctuation" do
		expect(substrings("I sit down, at my own table.",@dict)).to eq({"down"=>1, "it"=>1,
		                                                                "i"=>2, "own"=>2, "sit"=>1})
		expect(substrings("Howdy partner, sit down! How's it going?",@dict)).
		to eq({"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3,
		       "own"=>1,"part"=>1,"partner"=>1,"sit"=>1})
	end	
end