require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase

  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation", mail.subject
    assert_equal ["ruozhoubillyfan@nowhere.com"], mail.to
    assert_equal ["nidaye@example.com"], mail.from
    assert_match /2 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Pragmatic Store Order Shipped", mail.subject
    assert_equal ["ruozhoubillyfan@nowhere.com"], mail.to
    assert_equal ["nidaye@example.com"], mail.from
    assert_match /<td>2&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/,
      mail.body.encoded
  end

end
