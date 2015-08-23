# LuaGameMath

## About

A collection of math functions in Lua for game creation.

These functions have no dependencies and are not organized as classes or modules. This repository is designed as a collection from which to copy the particular functions you need.

### collisions.lua

(bool) isPointInAxisParallelRectangle(x, y, x1, y1, x2, y2)  
(bool) isPointInCircle(x, y, cx, cy, cr)  
(bool) isPointInTriangle(x, y, x1, y1, x2, y2, x3, y3)  
(bool) isPointInEllipse(x, y, ex, ey, ew, eh, ea)  
(bool) isPointInAxisParallelEllipse(x, y, ex, ey, ew, eh)  
(bool) isPointInPolygon(x, y, v)  

(bool) doCirclesIntersect(ax, ay, ar, bx, by, br)  
(bool) doesCircleInstersectAxisParallelRectangle(cx, cy, cr, rcx, rcy, rw, rh)  
(bool) doAxisParallelRectanglesIntersect(r1x, r1y, r1w, r1h, r2x, r2y, r2w, r2h)  

### trigonometry.lua

(list)   getPolarCoordinatePole(theta, radius)

(number) reflectAngleInDegrees(attackAngle, planeAngle)

(number) getLineAngleInDegreesFromPoints(x1, y1, x2, y2)  
(number) getLineAngleInRadiansFromPoints(x1, y1, x2, y2)  

(number) getHypotenuseLength(a, b)  
(number) getCathetusLength(h, a)  
(number) getDistanceBetweenPoints(x1, y1, x2, y2)  
