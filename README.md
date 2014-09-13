stickystamp-ruby
-----------------

A Ruby interface for StickyStamp API.

Usage
------

The library makes it very easy to make Stickystamp REST API calls. Let
me demonstrate it through a sample `irb` session:

    >>> require 'stickystamp'
    => true

This means you have installed the gem properly and are ready to go!
Now create a `StickyStamp` object. This object will be used for all
the interaction with the StickyStamp servers.

    >>> api = StickyStamp.new("b79bdeaa19f147afbbe2d7ef9dee9be2")
    => API Key: b79bdeaa19f147afbbe2d7ef9dee9be2

You pass an API key for creating a stickystamp object.
Now create a sample recipient:

    >>> r = Recipient.new("isaac","isaac@stickystamp.com","12, Krishnan Street","West Mambalam","Chennai","Tamilnadu","India","600033","888888888")
    => isaac isaac@stickystamp.com

Now get a specific recipient using an id passed to it:

    >>> api.getSpecificRecipient(8)
    => isaac isaac@stickystamp.com

Or, get the list of all Merchandise:

    >>> api.getAllMerchandise
    => [Campus Hero :tshirt, Code Ninja :tshirt, Thank You Card :postcard, Smashing Logo :sticker, Awesome Logo :sticker, Hacker :tshirt]

Note that every item in the list is an `object`. So you can play with
them individually:

    >>> b = api.getAllMerchandise
    => [Campus Hero :tshirt, Code Ninja :tshirt, Thank You Card :postcard, Smashing Logo :sticker, Awesome Logo :sticker, Hacker :tshirt]
    >>> b[0]
    => Campus Hero :tshirt
    >>> b[0].id
    => "T1-CMPSH"

Isn't that beautiful?

License
--------

MIT
