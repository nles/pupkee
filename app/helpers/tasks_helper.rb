module TasksHelper
  def billed_status(code)
    return "not billed" if code == 0
    return "billed" if code == 1
    return "does not apply"
  end

  def flag(index)
    return "important" if index == 1
    return "highlight" if index == 2
    return "minor" if index == 3
    return ""
  end
end
