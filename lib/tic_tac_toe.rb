WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]

  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def play(board)
  display_board(board)
  turn(board)
  over?(board)
  won?(board)
  turn(board)
  over?(board)
  won?(board)
  turn(board)
  over?(board)
  won?(board)



end
# method to execute the players move
def move(board, position, value = "X")

  board[position.to_i - 1] = value

  return board
end

# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def valid_move? (board, position)
  position = position.to_i - 1
    if position_taken?(board, position) == false  &&  position.between?(0, 10)
    return true
      elsif board[position] == "X" || board[position] == "O"
       return false

  end
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets
  if valid_move?(board, position) == true
    move(board, position)

  else turn(board)
  end
  display_board(board)
end

def turn_count(board)
counter = 0
board.each do |count|
  if count == "X" || count == "O"
    counter += 1
end
end
  counter
end

def current_player(board)
if turn_count(board) % 2 == 0
  "X"
else
  "O"
end
end
def draw?(board)
  if won?(board) == false
    return board.all? {|pos| pos == "X" || pos == "O"}
  else
    return false
  end
end


def full?(board)
  return board.all? {|pos| pos == "X" || pos == "O"}
end

def over?(board)
 if won?(board) == true || draw?(board) == true || full?(board) == true
   return true
   else
   return false
 end
end

def winner(board)

  if won?(board)
    return board[won?(board)[1]]
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combos|
    if board[combos[0]] == " " && board[combos[1]] == " " && board[combos[2]] == " "
      false
      elsif board[combos[0]] == board[combos[1]] && board[combos[0]] == board[combos[2]]
      return combos
      end
  end
  false
end