%call initialize board
rows = 3; cols = 3; turn = 1;
board = initializeBoard(rows, cols);
grid = boardToGrid(board, rows, cols);
agent_turn = 2;
imshow( grid );
while 1
    
    if turn ~= agent_turn
        [x, y] = ginput(1);
        [isLegal, x, y] = isLegalMove(board, x, y);
    else
       [ board, value ] = searchTreeTemp(board, turn, agent_turn);
    end
    
    while ~isLegal && turn ~= agent_turn
        [x, y] = ginput(1);
        [isLegal, x, y] = isLegalMove(board, x, y);
    end
    
    if turn ~= agent_turn
        board(x, y) = turn;
    end
    
    [ turn ] = changeTurn( turn );
    grid = boardToGrid(board, rows, cols);
    imshow(grid);
    
    if turn == 1;
        [ gameState ] = checkGameState(board, rows, cols, 2);
    else
        [ gameState ] = checkGameState(board, rows, cols, 1);
    end
    
    if gameState == 10
        if turn == 1
            msgbox('Player 2 won')
        else
            msgbox('Player 1 won')
        end
        break;
    else if gameState == 0
            msgbox('Game Draw')    
            break;
        end
    end
end