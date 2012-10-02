# XmlSplit

Split XML files on an element, yielding (streaming, so constant memory usage) each node in turn.

Uses [sgrep](http://www.cs.helsinki.fi/u/jjaakkol/sgrepman.html) internally.

As seen on ["Split XML files with `sgrep`, a classic UNIX utility from 1995"](http://numbers.brighterplanet.com/2012/09/11/split-xml-files-with-unix-utility-sgrep/)

Similar, but not identical, to [XML-Twig's xml_split](http://search.cpan.org/~mirod/XML-Twig-3.41/tools/xml_split/xml_split).

## Dependencies

Currently requires that you have `sgrep` or `sgrep2` in your path.

## Usage

    >> require 'xml_split'
    => true
    >> x = XmlSplit.new('15MinLP_15Days.xml', 'IntervalReading')
    => #<XmlSplit:0x0000010395ce60 @nodes=[], @cache_full=false, @path="/tmp/scratch/15MinLP_15Days.xml", @element="IntervalReading", @caching=false>
    >> x.each { |node| puts node }
    <IntervalReading>
        <cost>907</cost>
        <timePeriod>
            <duration>900</duration>
            <start>1330578000</start>
             <!-- 3/1/2012 5:00:00 AM  -->
        </timePeriod>
        <value>302</value>
    </IntervalReading>
    [...]

## Command-line

    gem install xml_split

This will give you a binary called `xml_split`. You can use it to split XML files into many smaller files:

    $ xml_split ~/samples/CLF8762E_20120709.xml MyElement CLF8762E/20120709
    [...]
    $ ls CLF8762E
    20120709_0000000000
    20120709_0000000001
    20120709_0000000002
    20120709_0000000003
    20120709_0000000004
    20120709_0000000005
    20120709_0000000006
    20120709_0000000007
    20120709_0000000008
    [...]

## Copyright

Copyright 2012 Brighter Planet, Inc.
