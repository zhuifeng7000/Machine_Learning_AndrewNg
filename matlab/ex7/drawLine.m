function drawLine(p1, p2, varargin)
%DRAWLINE Draws a line from point p1 to point p2
%   DRAWLINE(p1, p2) Draws a line from point p1 to point p2 and holds the
%   current figure
%p11_p21=[p1(1) p2(1)]
%P12_P22=[p1(2) p2(2)]
plot([p1(1) p2(1)], [p1(2) p2(2)], varargin{:});

end