function [isLegal, x, y] = isLegalMove(board, x, y)
    boardMaxSize = x * 100;
    if x > boardMaxSize || x < 0
        isLegal = false;
        return;
    end
    if y > boardMaxSize || y < 0
        isLegal = false;
        return;
    end
    
    temp = y;
    y = floor(x/100) + 1;
    x = floor(temp/100) + 1;
    
    if board(x, y) ~= 0
        isLegal = false;
        return;
    end
    isLegal = true;
end

