defmodule Day01.InverseCaptchaTest do
  use ExUnit.Case

  import Day01.InverseCaptcha

  describe "day 01 -" do
    test "part 1 - can sum all of the digits that match the next digit in the list" do
      assert calc_captcha("1122") == 3
      assert calc_captcha("1111") == 4
      assert calc_captcha("1234") == 0
      assert calc_captcha("91212129") == 9
    end

    test "part 2 - can sum all of the digits that match the next digit halfway around the circular list" do
      assert calc_circular_captcha("1212") == 6
      assert calc_circular_captcha("1221") == 0
      assert calc_circular_captcha("123425") == 4
      assert calc_circular_captcha("123123") == 12
      assert calc_circular_captcha("12131415") == 4
    end
  end
end
