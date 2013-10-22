Given /^the following articles exist:$/ do |table|
  table.hashes.each do |article|
    Article.create!(article)
  end
end

Given /^the following users exist:$/ do |table|
  table.hashes.each do |user|
    User.create!(user)
  end
end

Given /^the following comments exist:$/ do |table|
  #table.map_headers!('body' => :body, 'author' => :author, 'article' => :article)
  table.hashes.each do |comment|
  #  new_comment = {:body => comment[:body], :author => comment[:author], :email => User.find_by_login(comment[:author])}#, :url => 'http://google.com/',article_id => Article.find_by_title(comment[:article]).id.to_s}  
    #Comment.create(new_comment)    
    #Feedback.create(comment)
  end
end
      
Given /^I am logged into the admin panel as "(.*?)"$/ do |user|
  visit '/accounts/login'
  fill_in 'user_login', :with => user
  fill_in 'user_password', :with => user +"_pw"
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
 end
end

Given /^I visit the edit page for "(.*?)"$/ do |article|
  visit 'admin/content/edit/' + Article.find_by_title(article).id.to_s
end

Then /^the "(.*?)" author should be "(.*?)"$/ do |article, author|
  article_author = Article.find_by_title(article).author
  assert article_author.should == "Author "+author
end


Given /^I merge the article with "(.*?)"$/ do |article|
  fill_in 'merge_with', :with => Article.find_by_title(article).id
  click_button 'Merge'
end

Given /^I merge "(.*?)" with "(.*?)"$/ do |article1, article2|
  visit 'admin/content/edit/' + Article.find_by_title(article1).id.to_s
  fill_in 'merge_with', :with => Article.find_by_title(article2).id
  click_button 'Merge'
end
