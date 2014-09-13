stickystamp-ruby
-----------------

A Ruby interface to StickStamp API.

Usage
------

Invoke `irb`:

    >>> require './stickystamp'
    => true
    >>> r = Recipient.new("Sibi","sibi@psibi.in","add1","add2","Chennai","TN","IN","666666","777777777")
    => Sibi sibi@psibi.in
    >>> a = StickStamp.new("b79bdeaa19f147afbbe2d7ef9dee9be2")
    => API Key: b79bdeaa19f147afbbe2d7ef9dee9be2
    >>> a.getSpecificRecipient(8)
    => isaac isaac@stickystamp.com
    >>> a.getAllMerchandise
    => [Campus Hero :tshirt, Code Ninja :tshirt, Thank You Card :postcard, Smashing Logo :sticker, Awesome Logo :sticker, Hacker :tshirt]
    >>> b = a.getAllMerchandise
    => [Campus Hero :tshirt, Code Ninja :tshirt, Thank You Card :postcard, Smashing Logo :sticker, Awesome Logo :sticker, Hacker :tshirt]
    >>> b[0]
    => Campus Hero :tshirt
    >>> b[0].id
    => "T1-CMPSH"
