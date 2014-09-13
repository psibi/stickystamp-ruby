require 'test/unit'
require 'stickystamp'

class TestStickyStamp < Test::Unit::TestCase

  def test_getSkus
    ss_api = StickyStamp.new("b79bdeaa19f147afbbe2d7ef9dee9be2")
    assert_nothing_raised do
      ss_api.getSkus
    end
  end

  def test_getSpecificSku
    ss_api = StickyStamp.new("b79bdeaa19f147afbbe2d7ef9dee9be2")
    assert_nothing_raised do
      ss_api.getSpecificSku("PC1-THNKY-V1")
    end
  end

  def test_getAllMerchandise
    ss_api = StickyStamp.new("b79bdeaa19f147afbbe2d7ef9dee9be2")
    assert_nothing_raised do
      ss_api.getAllMerchandise
    end
  end

  def test_getSpecificMerchandies
    ss_api = StickyStamp.new("b79bdeaa19f147afbbe2d7ef9dee9be2")
    assert_nothing_raised do
      ss_api.getSpecificMerchandise "PC1-THNKY"
    end
  end

  def test_getSkuByMerchandise
    ss_api = StickyStamp.new("b79bdeaa19f147afbbe2d7ef9dee9be2")
    assert_nothing_raised do
      ss_api.getSkuByMerchandise "t1-cmpsh"
    end
  end

  def test_createRecipient
    ss_api = StickyStamp.new("b79bdeaa19f147afbbe2d7ef9dee9be2")
    r = Recipient.new("isaac","isaac@stickystamp.com","12, Krishnan Street","West Mambalam","Chennai","Tamilnadu","India","600033","888888888")
    assert_nothing_raised do
      ss_api.createRecipient r
    end
  end

  def test_getRecipients
    ss_api = StickyStamp.new("b79bdeaa19f147afbbe2d7ef9dee9be2")
    r = Recipient.new("isaac","isaac@stickystamp.com","12, Krishnan Street","West Mambalam","Chennai","Tamilnadu","India","600033","888888888")
    assert_nothing_raised do
      ss_api.getRecipients r
    end
  end
    
  def test_getSpecificRecipient
    ss_api = StickyStamp.new("b79bdeaa19f147afbbe2d7ef9dee9be2")
    r = Recipient.new("isaac","isaac@stickystamp.com","12, Krishnan Street","West Mambalam","Chennai","Tamilnadu","India","600033","888888888")
    assert_nothing_raised do
      ss_api.getSpecificRecipient "8"
    end
  end

end
    
