Feature: XmlSplit

Scenario:
  Given the element to split by "foo" and XML
    """
    <foo>bar</foo><foo>baz</foo>
    """
  Then calling :to_a must give ["<foo>bar</foo>", "<foo>baz</foo>"]
