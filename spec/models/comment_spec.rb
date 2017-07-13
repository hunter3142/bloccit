require 'rails_helper'

RSpec.describe Comment, type: :model do
  	let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
   	let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
   	let(:sponsored_post) { topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: 99) }
   	let(:comment) { Comment.create!(body: 'Comment Body', post: post) }
   	let(:sponsor_comment) { Comment.create!(body: 'Sponsor Comment Body', sponsored_post: sponsored_post)}
 
   	describe "attributes" do
     	it "has a comment body attribute" do
       		expect(comment).to have_attributes(body: "Comment Body")
     	end

     	it "has a sponsor comment body attribute" do
       		expect(sponsor_comment).to have_attributes(body: "Sponsor Comment Body")
     	end
   	end
end
