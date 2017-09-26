% Group members: Willis Larson, Conner Babinchak, Sean McHale
% Group number L01
% Program lets user enter graph data, plot type, plot color, plot title, and plot axis
% and plots the data

keepRunning = true;
while keepRunning %Program iterates until user does not want to enter more data
    badData = true;
    while badData %loop checks for bad data
        badData = false;
        try
            data = load(input('Please enter the name of the data file: ','s'));
            dataSize = size(data);
        catch
            disp('Bad data')
            badData = true;
            continue
        end
        if dataSize(1) == 2 %makes note of the format of the data
            dataFormat = 'r';
            %data is in rows
        elseif dataSize(2) == 2
            dataFormat = 'c';
            %data is in columns
        else
            disp('Bad data, data must be two functions, therefore one dimension must be equal to two.')
            badData = true;
        end
    end
    symbolTypeNumber = menu('Select plot symbol','solid line','dotted line','dash-dot line','dashed line','point','circle','cross','plus sign','star','square','diamond','triangle down','triangle up','triangle right','triangle left','pentagram','hexagram');
    switch symbolTypeNumber
        case 1
            symbolType = '-';
        case 2
            symbolType = ':';
        case 3
            symbolType = '-.';
        case 4
            symbolType = '--';
        case 5
            symbolType = '.';
        case 6
            symbolType = 'o';
        case 7
            symbolType = 'x';
        case 8
            symbolType = '+';
        case 9
            symbolType = '*';
        case 10
            symbolType = 's';
        case 11
            symbolType = 'd';
        case 12
            symbolType = 'v';
        case 13
            symbolType = '^';
        case 14
            symbolType = '>';
        case 15
            symbolType = '<';
        case 16
            symbolType = 'p';
        case 17
            symbolType = 'h';
    end
    while true
        symbolColor = input('Enter symbol color(y,m,c,r,g,b,w,k): ','s');
        if length(symbolColor) == 1 %tests if it is a character
            if sum(symbolColor == 'ymcrgbwk') == 1 %then tests to see if that character lies within string of valid characters
                break
            end
        disp('Invalid symbol color')
        end
    end
    if dataFormat == 'r' %plots graph according to data format, and the symbol information the user selected
        plot(data(1,:),data(2,:),[symbolColor,symbolType])
    elseif dataFormat == 'c'
        plot(data(:,1),data(:,2),[symbolColor,symbolType])
    end
    title(input('Title for graph: ','s'))
    xlabel(input('x-axis label: ','s'))
    ylabel(input('y-axis label: ','s'))
    while true
        switch lower(input('Do you want to enter a new set of data?(y/n) ','s'))
            case 'y'
                break
            case 'n'
                keepRunning = false;
                break
            otherwise
                disp('Not a valid response, please enter "y" or "n".')
        end
    end
end
    