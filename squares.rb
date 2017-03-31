class Squares
  attr_reader :bomb, :revealed, :flag, :prox

  def initialize(bomb = false)
    @bomb = bomb
    @revealed = false
    @flag = false
    @prox = 0
  end

  def toggle_flag
    flag ? @flag = false : @flag = true
  end

  def reveal
    @revealed = true
  end

  def show_nearby(num)
    @prox = num
  end

  def show
    return "_ " if revealed == false && !flag
    return "#{:f} " if flag
    return "#{:O} " if prox.zero? && !bomb
    return "* " if bomb
    nil
  end
end
