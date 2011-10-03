Then /^I should see "([^"]*)" in "([^"]*)"$/ do | what, where |
  steps %Q{ Then I should see "#{what}" within "#{where}"}
end

When /^show$/ do
  save_and_open_page
end

When /^what$/ do
  debugger
end


Then /^I should see the link "([^"]*)"$/ do | text |
  page.should have_link(text)
end

Then /^I should not see the link "([^"]*)"$/ do | text |
  page.should have_no_link(text)
end


Then /^I should see (\d+) "([^"]*)"$/ do | count, what |
  page.should have_css(what, :count => count.to_i)
end

Then /^I should not see the section "([^"]*)"$/ do | selector |
  page.should have_no_css(selector)
end

Then /^I should see the section "([^"]*)"$/ do | selector |
  page.should have_css(selector)
end

Then /^I should see a link to "([^"]*)"$/ do | url |
  page.body.should =~ /#{url}/
end

Then /^it should have a page title of "([^"]*)"$/ do | text |
  page.should have_css('head title', :text => text)
end

Then /^I should see "([^"]*)" as the title$/ do |text|
  unless page.has_css?('h1', :text => text) or page.has_css?('h2', :text => text) or page.has_css?('h3', :text => text) or page.has_css?('h4', :text => text) or page.has_css?('input#project_title')
    flunk("Didnt see #{text} in a h1, h2, h3, or h4 tag") 
  end
end

Then /^I should see the image "([^"]*)"$/ do |name|
  page.should have_xpath("//img[contains(@src, \"#{name}\")]")
end

Then /^I should not see the image "([^"]*)"$/ do |name|
  page.should have_no_xpath("//img[contains(@src, \"#{name}\")]")
end

Then /^I should see the image alt "([^"]*)"$/ do |alt_text|
  page.should have_css('img', :alt => alt_text)
end

Then /^I should not see the image alt "([^"]*)"$/ do |alt_text|
  page.body.should_not =~ /#{alt_text}/
end

Then /^I should not see button "([^"]*)"$/ do |button_text|
  page.should have_no_button(button_text)
end

Then /^I should see button "([^"]*)"$/ do |button_text|
  page.should have_button(button_text)
end

Then /^I should not see the button "([^"]*)"$/ do |button_text|
  page.should have_no_button(button_text)
end


Then /^"([^"]*)" should be the selected menu item$/ do |text|
  page.should have_css("li.selected", :text => text)
end

Then /^nothing should be the selected menu item$/ do
  page.should have_no_css("li.selected")
end


Then /^I should see "([^"]*)" before "([^"]*)"$/ do |text_1, text_2|
  flunk("Found #{text_2} before #{text_1}") unless (page.body =~ /#{text_1}/) < (page.body =~ /#{text_2}/)
end

Then /^I should see "([^"]*)" after "([^"]*)"$/ do |text_1, text_2|
  flunk("#{text_1} not found") unless (page.body =~ /#{text_1}/)
  flunk("#{text_2} not found") unless (page.body =~ /#{text_2}/)
  flunk("Found #{text_2} after #{text_1}") unless (page.body =~ /#{text_1}/) > (page.body =~ /#{text_2}/)
end

Then /^I should see these things in this order:$/ do |table|
  table.hashes.each_with_index do |line, index|
    table.hashes.size
    if index == (table.hashes.size - 1)
      page.should have_content(line["Item"])
    else
      next_item = table.hashes[index + 1]
      steps %Q{ Then I should see "#{next_item['Item']}" after "#{line['Item']}" }
    end
  end
end