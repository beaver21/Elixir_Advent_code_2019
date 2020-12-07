defmodule Day2Test do
  use ExUnit.Case
  import Day2

  test "read password policies" do
    password = "1-3 a: abcdcd"

    expected = %{
      first_param: 1,
      second_param: 3,
      letter: "a",
      password: "abcdcd"
    }

    assert expected == read_password(password)
  end

  test "find password letter count" do
    password = "1-3 a: abcdada"
    password_read = read_password(password)

    assert find_letter_count(password_read) == 3
  end

  test "letter count is between" do
    password = "1-3 a: abcdada"
    password_read = read_password(password)

    assert letter_count_is_between(password_read)
  end

  test "is password valid type count" do
    password = "2-3 f: adffd"

    assert is_password_valid(password, "count")
  end

  test "is valid password type position" do
    password = "2-9 c: scfdfdfd"

    assert is_password_valid(password, "position")
  end

  test "count valid password by count" do
    passwords = [
      "1-3 b: adfbbg",
      "1-5 c: dadada",
      "1-4 a: adfgaada"
    ]

    assert count_valid_passwords(passwords, "count") == 2
  end


end
