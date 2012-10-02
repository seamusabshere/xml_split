require 'tempfile'

Given /the element to split by "(.*)" and XML/ do |element, xml|
  tmp = Tempfile.new(element)
  tmp.write xml
  tmp.flush
  @object = XmlSplit.new(tmp.path, element)
end

Then /calling :(.*) must give (.*)/ do |method_id, raw_nodes|
  nodes = eval raw_nodes
  @object.send(method_id).should == nodes
end
