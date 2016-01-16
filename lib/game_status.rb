# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant, [2,5,8], [0,4,8], [6,4,2]
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if position_taken?(board, combo.first) && (board[combo.first] == board[combo[1]]) && (board[combo[1]] == board[combo.last])
      return combo
    end
  end
  false
end

def full?(board)
  board.all?{ |x| x == "X" || x == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  if won?(board)
    board[won?(board).first]
  end 
end