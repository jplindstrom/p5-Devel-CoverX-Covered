reveal-haml-presentation
========================

Template for creating reveal.js presentations with Haml markup.

## Installation

* Install Ruby
* Install Haml

        sudo gem install haml
        sudo gem install redcarpet
        # possibly others


* Clone the project

        git clone git@github.com:jplindstrom/reveal-haml-presentation.git
        cd reveal-haml-presentation/
        git submodule init && git submodule update

## Write Presentation

* Edit index.haml (or copy to another name), open the .html file in a
  browser.

* Start the auto-builder

        ./watch-haml-files.pl

* This will rebuild all .haml files and then watch them, rebuilding
  them on change

* Write a kick-ass presentation!



