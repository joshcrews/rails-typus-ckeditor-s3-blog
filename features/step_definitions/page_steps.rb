Given /^a page exists with #{capture_fields}$/ do |fields|
  fieldz = Pickle::Parser.new(:config => Pickle.config).parse_fields(fields)
  Factory(:page, fieldz)
end