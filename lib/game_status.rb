# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  #for each win_combination in WIN_COMBINATIONS
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.
   # win_index_1 = win_combination[0]
   # win_index_2 = win_combination[1]
    #win_index_3 = win_combination[2]
  
   # position_1 = board[win_index_1] # load the value of the board at win_index_1
   # position_2 = board[win_index_2] # load the value of the board at win_index_2
   # position_3 = board[win_index_3] # load the value of the board at win_index_3
  
   # if position_1 == "X" && position_2 == "X" && position_3 == "X"
   #   return win_combination # return the win_combination indexes that won.
   # else
   #   false
   # end
  #end
  if board.all?{|position| position.include?(" ")}
    return false
  end

  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end


end

def full?(board)
  board.all? do |player|
    player.include?("X") || player.include?("O")
  end
    
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  if !won?(board)
      return nil
  end
  win_index = won?(board)[0]
  board[win_index]
  
end
  


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  
 
] 