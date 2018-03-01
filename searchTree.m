function [ nextBoard, value ] = searchTree(board, turn, agentTurn)
    
    [ gameState ] = checkGameState(board, 3, 3, turn);
    if ( gameState == 10 || gameState == 0 )
        nextBoard = board;
        if( gameState == 0 )
            value = 0;
            return;
        end
        %[ l c ] = size(find(board == 0));
        if( turn == agentTurn )
            value = 10;
        else
            value = -10;
        end
        return;
    end
    
    children = generateChildren(board, turn);
    [ r c l ] = size(children);
    valuesList = zeros(1, l);
    for i=1:l
        if turn == 2
            nextTurn = 1;
        else
            nextTurn = 2;
        end
        
        [ bestBoard, resultValue ] = searchTree( children(:, :, i), nextTurn, agentTurn );
        %bestBoard = children(:, :, i);
        valuesList(1, i) = resultValue;
    end
    
    if( turn == agentTurn )
        [ min_max index ] = max(valuesList);
    else
        [ min_max index ] = min(valuesList);
    end
    nextBoard = children(:, :, index);
    value = min_max;  
end