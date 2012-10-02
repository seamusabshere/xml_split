# XmlSplit

Split XML files on an element, yielding (streaming, so constant memory usage) each node in turn.

Uses [sgrep](http://www.cs.helsinki.fi/u/jjaakkol/sgrepman.html) internally.

As seen on ["Split XML files with `sgrep`, a classic UNIX utility from 1995"](http://numbers.brighterplanet.com/2012/09/11/split-xml-files-with-unix-utility-sgrep/)

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

## Copyright

Copyright 2012 Brighter Planet, Inc.
