require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe "Validations" do
    # We can use it method (or specify) to define a test example. The method takes a first argument which is the example description & it takes a block of code where you actually write your test.
    # Make the description really clear so reader of the message know what the test is about.
    it "requires a title" do
      #GIVEN: a campaign record with no title
      c = Campaign.new
      #WHEN: when we run validations
      c.valid? #<- incurs validation
      #THEN: the record is invalid (it has errors)
      # expect(c).to be_invalid
      expect(c.errors).to have_key(:title) #<- more precise version to make sure you get title validation instead of any validation
    end

    it 'requires a unique title' do
      #GIVEN: A campaign created in the DB w/ a title. New campaign w/ same title.
      Campaign.create({title:'valid title', description: 'abc', goal:'100', end_date: Time.now + 60.days})
      c = Campaign.new title:'valid title'
      #WHEN: We run validations
      c.valid?
      #THEN: The record has an error on the title field
      expect(c.errors).to have_key(:title)
    end
  end

  describe ".titleized_title" do
    it 'returns a titleized version of the title' do
      #GIVEN: campaign with a title
        c = Campaign.new title: "hello world"
      #WHEN: the titleized_title method
        outcome = c.titleized_title
      #THEN: we get back a titleized title version of the title
        expect(outcome).to eq("Hello World")
    end
  end

end
