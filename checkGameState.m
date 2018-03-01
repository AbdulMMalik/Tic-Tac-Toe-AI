function [ gameState ] = checkGameState( board, row, col, turn )
    win = isWin(board, row, col , turn);
    if win == true
        gameState = 10;
        return;
    else
        draw = isDraw(board, row, col);
        if draw == true
            gameState = 0;
            return;
        end
    end
    
    gameState = 5;
end

