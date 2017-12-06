defmodule Day02.CorruptionChecksumTest do
  use ExUnit.Case

  import Day02.CorruptionChecksum

  describe "day 02 -" do
    test "part 1 - can calculate the checksum for the spreadsheet" do
      input = """
      5\t1\t9\t5
      7\t5\t3
      2\t4\t6\t8
      """

      assert calc_spreadsheet_checksum(input) == 18
    end

    test "part 2 - " do
      input = """
      5\t9\t2\t8
      9\t4\t7\t3
      3\t8\t6\t5
      """

      assert calc_spreadsheet_checksum_evenly_divisible(input) == 9
    end
  end
end
