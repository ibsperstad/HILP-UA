function [h, h_stairs] = format_pdf(h,incl_label,color)
% FORMAT_CDF Formats plot of Probability Density Function (PDF)
% 
%   [H, H_STAIRS] = FORMAT_CDF(H,INCL_LABEL,COLOR) formats an input
%   histogram object handle H and returns it together with a separate stairs
%   (plot) object handle H_STAIRS for the actual PDF curve. An y-axis label
%   is printed if INCL_LABEL = true, and COLOR (optional) can be used to
%   specify the colour of the PDF curve.

FontSizeLabel = 14;

if nargin < 3
    color = 'k';
    face_color = 'w';
else
    face_color = 'none';
end

set(h,'Normalization','pdf')
set(h,'EdgeColor','none')
set(h,'FaceColor',face_color)
hold on

h_stairs = stairs([h.BinEdges(1)-eps h.BinEdges],[0 h.Values 1],'LineWidth',1,'Color',color);

if nargin > 1 && incl_label == true
    ylabel('Probability density function $f$','FontSize',FontSizeLabel,'Interpreter','latex')
end