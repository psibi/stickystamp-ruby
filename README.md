stickystamp-ruby
-----------------

A Ruby interface to StickStamp API.

Usage
------

Invoke `irb`:

    irb(main):001:0> require './stickystamp'
    => true
    irb(main):002:0> r = Recipient.new("Sibi","sibi@psibi.in","add1","add2","Chennai","TN","IN","666666","777777777")
    => Sibi sibi@psibi.in
    irb(main):003:0> a = StickStamp.new("b79bdeaa19f147afbbe2d7ef9dee9be2")
    => API Key: b79bdeaa19f147afbbe2d7ef9dee9be2
    irb(main):004:0> a.getSpecificRecipient(r,8)
    => isaac isaac@stickystamp.com
    irb(main):005:0> a.getAllMerchandise
    => [Campus Hero :tshirt, Code Ninja :tshirt, Thank You Card :postcard, Smashing Logo :sticker, Awesome Logo :sticker, Hacker :tshirt]
    irb(main):007:0> b = a.getAllMerchandise
    => [Campus Hero :tshirt, Code Ninja :tshirt, Thank You Card :postcard, Smashing Logo :sticker, Awesome Logo :sticker, Hacker :tshirt]
    irb(main):008:0> b[0]
    => Campus Hero :tshirt
    irb(main):009:0> b[0].id
    => "T1-CMPSH"
