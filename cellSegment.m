function [binaryField,cellBounds] = cellSegment(cellImage)
    dim = length(size(cellImage));
    switch dim
        case 2
            connectSparse = 4;
            connectDense = 8;
        case 3
            connectSparse = 8;
            connectDense = 26;
        otherwise
            error('ERROR: Wrong dimension for input to cellSegment()')
    end
    binaryField = imbinarize(cellImage,'global');
    % make sure that the boundaries have no leaks
    binaryField = imfill(binaryField,connectSparse,'holes');
    cellBounds = bwboundaries(binaryField,connectSparse,'noholes');
end