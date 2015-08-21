function [volume,area]=volume_area_3D(v)
% compute volume and area of a convex hull of points v
% Malcolm A. MacIver, 2003

[K,volume]=convhulln(v);

%
% Basic formula for computing triangle area
% || = 2-norm, VN = vertex of triangle
% ||V1 X V2 + V2 X V3 + V3 X V1||/2

area= ...
 sum(sqrt(sum(( ...
 [v(K(:,1),2).*v(K(:,2),3) - v(K(:,1),3).*v(K(:,2),2) ...
  v(K(:,1),3).*v(K(:,2),1) - v(K(:,1),1).*v(K(:,2),3)  ...
  v(K(:,1),1).*v(K(:,2),2) - v(K(:,1),2).*v(K(:,2),1)] + ...
 [v(K(:,2),2).*v(K(:,3),3) - v(K(:,2),3).*v(K(:,3),2) ...
  v(K(:,2),3).*v(K(:,3),1) - v(K(:,2),1).*v(K(:,3),3)  ...
  v(K(:,2),1).*v(K(:,3),2) - v(K(:,2),2).*v(K(:,3),1)] + ...
 [v(K(:,3),2).*v(K(:,1),3) - v(K(:,3),3).*v(K(:,1),2) ...
  v(K(:,3),3).*v(K(:,1),1) - v(K(:,3),1).*v(K(:,1),3)  ...
  v(K(:,3),1).*v(K(:,1),2) - v(K(:,3),2).*v(K(:,1),1)]).^2,2))) ...
  /2;

