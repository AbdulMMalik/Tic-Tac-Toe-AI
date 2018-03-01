function grid = boardToGrid(board, rows, cols)
    size_rows = rows * 100;
    size_cols = cols * 100;
    
    grid = ones(size_rows, size_cols);
    printLine = 100;
    for i = 1:rows-1
        printLine = printLine * i;
        grid(:, printLine) = 0;
        grid(:, (printLine+1)) = 0;
    end
    printLine = 100;
    for i = 1:rows-1
        printLine = printLine * i;
        grid(printLine, :) = 0;
        grid((printLine+1), :) = 0;
    end
    
    printCharRow = 50;
    printCharCol = 50;
    r = 20;
 
    for i = 1:rows
        for j=1:cols
            if board(i, j) == 1
                for theta=0:0.25:360
                    radian = theta * (3.14/180);
                    x = ceil(r * cos(radian) + printCharRow);
                    y = ceil(r * sin(radian) + printCharCol);
                    grid(x, y) = 0;
                end
            elseif board(i, j) == 2
                diagonal = 0;
                startColumnA = printCharCol - 20;
                startColumnB = printCharCol + 20;
                startRow = printCharRow - 20;
                
                for random=1:40
                    grid(startRow, startColumnA) = 0;
                    grid(startRow, startColumnB) = 0;
                    diagonal = diagonal + 1;
                    startColumnA = startColumnA + 1;
                    startColumnB = startColumnB - 1;  
                    startRow = startRow + 1;
                end
            end
            printCharCol = printCharCol + 100;
        end
            printCharRow = printCharRow + 100;
            printCharCol = 50;
    end
end

