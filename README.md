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
Now you can create a sample recipient object like this:

    >>> r = Recipient.new("isaac","isaac@stickystamp.com","12, Krishnan Street","West Mambalam","Chennai","Tamilnadu","India","600033","888888888")
    => isaac isaac@stickystamp.com

To create it in the server, all you have to do is:

    >>> recipient = api.createRecipient(r)
    => isaac isaac@stickystamp.com

Now you can inspect that recipient object:

    >>> recipient.id
    => 33

You can also get information about a specific recipient, if you kwow
it's id:

    >>> another_recipient = api.getSpecificRecipient(33)
    => isaac isaac@stickystamp.com
    another_recipient.email
    => "isaac@stickystamp.com"
    another_recipient.country
    => "India"

To get the list of all shipments:

    >>> api.getShipments
    => [352, 354, 371, 448, 454, 593, 597, 670, 733, 734, 779, 792]

Note that each list we got above is an object internally:

    >>> shipments = api.getShipments
    => [352, 354, 371, 448, 454, 593, 597, 670, 733, 734, 779, 792]
    >>> shipments[4].tax
    => "0.00"

To get an information about specific shipment:

    >>> shipment_371 = api.getSpecificShipment "371"
    => 371
    >>> shipment_371.recipient["email"]
    => "s3@s.com"

Similarly you can get all the getGrantForms:

    >>> api.getGrantForms
    =>  [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]

You can play around with each of the objects:

    >>> gforms = a.getGrantForms
    =>
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
    >>> gforms[0].id
    => 1
    >>> gforms[0].url
    => "http://beta.stickystamp.com/shiptokens/convert/95d9cf352d994e67820060930fb055f8"
    
To get the list of all Merchandise:

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
