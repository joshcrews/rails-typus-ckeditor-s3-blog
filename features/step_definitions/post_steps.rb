Given /^a post exists with #{capture_fields}$/ do |fields|
  fieldz = Pickle::Parser.new(:config => Pickle.config).parse_fields(fields)
  Factory(:post, fieldz)
end

Given /^a post exists from "([^"]*)" with #{capture_fields}$/ do |date, fields|
  fieldz = Pickle::Parser.new(:config => Pickle.config).parse_fields(fields)
  post = Factory(:post, fieldz)
  post.update_attribute(:created_at, Time.parse(date))
end

