--[[
Title:     math functions
Version:   1.0
Author:    Pierre-Emmanuel Lévesque
Email:     pierre.e.levesque@gmail.com
Date:      October 14th, 2013
Copyright: Copyright 2013, Pierre-Emmanuel Lévesque
License:   MIT license - @see LICENSE.md
--]]

--[[
	Gets the polar coordinate pole (P point) from theta and radius

	@param   number   theta (angle in radians)
	@param   number   radius
	@return  list     x, y
--]]
function getPolarCoordinatePole(theta, radius)
	return math.cos(theta) * radius, math.sin(theta) * radius
end

--[[
	Gets a line's angle in degrees from its points

	@param   number   x1
	@param   number   y1
	@param   number   x2
	@param   number   y2
	@return  number   angle (degrees)
--]]
function getLineAngleInDegreesFromPoints(x1, y1, x2, y2)
	return math.atan2(y2 - y1, x2 - x1) * 180 / math.pi
end

--[[
	Reflects an angle in degrees off a plane

	@param   number   attack angle (degrees)
	@param   number   plane angle (degrees)
	@return  number   reflected angle (degrees)
--]]
function reflectAngleInDegrees(attackAngle, planeAngle)
	return ((2 * planeAngle) - attackAngle) % 360
end

--[[
	Checks if a point is in an axis parallel rectangle

	@param   number   point x
	@param   number   point y
	@param   number   rectangle x1 (upper left)
	@param   number   rectangle y1 (upper left)
	@param   number   rectangle x2 (lower right)
	@param   number   rectangle y2 (lower right)
	@return  bool     is point in rectangle
--]]
function isPointInAxisParallelRectangle(x, y, x1, y1, x2, y2)
	return x > x1 and x < x2 and y > y1 and y < y2
end

--[[
	Checks if a point is on an axis parallel rectangle

	Note: Like isPointInAxisParallelRectangle, but the sides are included.

	@param   number   point x
	@param   number   point y
	@param   number   rectangle x1 (upper left)
	@param   number   rectangle y1 (upper left)
	@param   number   rectangle x2 (lower right)
	@param   number   rectangle y2 (lower right)
	@return  bool     is point in rectangle
--]]
function isPointOnAxisParallelRectangle(x, y, x1, y1, x2, y2)
	return x >= x1 and x <= x2 and y >= y1 and y <= y2
end

--[[
	Checks if a point is in a circle

	@param   number   point x
	@param   number   point y
	@param   number   center x
	@param   number   center y
	@return  bool     is point in circle
--]]
function isPointInCircle(x, y, cx, cy, cr)
	return (x - cx)^2 + (y - cy)^2 < cr^2
end

--[[
	Checks if a point is on a circle

	Note: Like isPointInCircle, but the side is included.

	@param   number   point x
	@param   number   point y
	@param   number   center x
	@param   number   center y
	@return  bool     is point in circle
--]]
function isPointOnCircle(x, y, cx, cy, cr)
	return (x - cx)^2 + (y - cy)^2 <= cr^2
end

--[[
	Checks if a point is in a triangle

	Note: This is a baycentric algorithm.

	@param   number   point x
	@param   number   point y
	@param   number   triangle x1
	@param   number   triangle y1
	@param   number   triangle x2
	@param   number   triangle y2
	@param   number   triangle x3
	@param   number   triangle y3
	@return  bool     is point in triangle
--]]
function isPointInTriangle(x, y, x1, y1, x2, y2, x3, y3)
	local inTriangle = false
	local A = 1 / 2 * (-y2 * x3 + y1 * (-x2 + x3) + x1 * (y2 - y3) + x2 * y3)
	local sign
	if A < 0 then sign = -1 else sign = 1 end
	local s = (y1 * x3 - x1 * y3 + (y3 - y1) * x + (x1 - x3) * y) * sign
	if s > 0 then
		local t = (x1 * y2 - y1 * x2 + (y1 - y2) * x + (x2 - x1) * y) * sign
		if t > 0 then
			if (s + t) < 2 * A * sign then
				inTriangle = true
			end
		end
	end
	return inTriangle
end

--[[
	Checks if a point is on a triangle

	Note: This is a baycentric algorithm.

	Note: Like isPointInTriangle, but the sides are included.

	@param   number   point x
	@param   number   point y
	@param   number   triangle x1
	@param   number   triangle y1
	@param   number   triangle x2
	@param   number   triangle y2
	@param   number   triangle x3
	@param   number   triangle y3
	@return  bool     is point in triangle
--]]
function isPointOnTriangle(x, y, x1, y1, x2, y2, x3, y3)
	local inTriangle = false
	local A = 1 / 2 * (-y2 * x3 + y1 * (-x2 + x3) + x1 * (y2 - y3) + x2 * y3)
	local sign
	if A < 0 then sign = -1 else sign = 1 end
	local s = (y1 * x3 - x1 * y3 + (y3 - y1) * x + (x1 - x3) * y) * sign
	if s > 0 then
		local t = (x1 * y2 - y1 * x2 + (y1 - y2) * x + (x2 - x1) * y) * sign
		if t > 0 then
			if (s + t) <= 2 * A * sign then
				inTriangle = true
			end
		end
	end
	return inTriangle
end

--[[
	Checks if a point is in a polygon

	Note: This works for convex and concave polygons.

	Ported from: http://www.ecse.rpi.edu/Homepages/wrf/Research/Short_Notes/pnpoly.html
	Author: W. Randolph Franklin

	Polygon vertices format: {x1, y1, x2, y2, x3, y3, …)

	@param   number   point x
	@param   number   point y
	@param   table    polygon vertices
	@return  bool     is point in polygon
--]]
function isPointInPolygon(x, y, v)
	local inPolygon = false
	local lastV = #v - 1
	local j = lastV
	for i = 1, j, 2 do
		if ((v[i+1] > y) ~= (v[j+1] > y)) and (x < (v[j] - v[i]) * (y - v[i+1]) / (v[j+1] - v[i+1]) + v[i]) then
			if inPolygon then inPolygon = false else inPolygon = true end
		end
		if j == lastV then j = -1 end
		j = j + 2
	end
	return inPolygon
end

--[[
	Checks if a point is in an ellipse

	Note: This algorithm is not very efficient because of sin and cos,
	      and it hasn't been tested.

	@param   number   point x
	@param   number   point y
	@param   number   ellipse x
	@param   number   ellipse y
	@param   number   ellipse width
	@param   number   ellipse height
	@param   number   ellipse angled
	@return  bool     is point in ellipse
--]]
function isPointInEllipse(x, y, ex, ey, ew, eh, ea)
	local A = ((x - ex) * math.cos(ea) - (y - ey) * math.sin(ea))^2 / (ew/2)^2
	local B = ((x - ex) * math.sin(ea) + (y - ey) * math.cos(ea))^2 / (eh/2)^2
	return A + B < 1
end

--[[
	Checks if a point is on an ellipse

	Note: This algorithm is not very efficient because of sin and cos,
	      and it hasn't been tested.

	Note: Like isPointInEllipse, but the sides are included.

	@param   number   point x
	@param   number   point y
	@param   number   ellipse x
	@param   number   ellipse y
	@param   number   ellipse width
	@param   number   ellipse height
	@param   number   ellipse angled
	@return  bool     is point in ellipse
--]]
function isPointOnEllipse(x, y, ex, ey, ew, eh, ea)
	local A = ((x - ex) * math.cos(ea) - (y - ey) * math.sin(ea))^2 / (ew/2)^2
	local B = ((x - ex) * math.sin(ea) + (y - ey) * math.cos(ea))^2 / (eh/2)^2
	return A + B <= 1
end

--[[
	Checks if a point is in an axis parallel ellipse

	@param   number   point x
	@param   number   point y
	@param   number   ellipse x
	@param   number   ellipse y
	@param   number   ellipse width
	@param   number   ellipse height
	@return  bool     is point in non angled ellipse
--]]
function isPointInAxisParallelEllipse(x, y, ex, ey, ew, eh)
	return ((x - eh)^2 / ew^2) + ((y - ey)^2 / eh^2) < 1
end

--[[
	Checks if a point is on an axis parallel ellipse

	Note: Like isPointInAxisParallelEllipse, but the sides are included.

	@param   number   point x
	@param   number   point y
	@param   number   ellipse x
	@param   number   ellipse y
	@param   number   ellipse width
	@param   number   ellipse height
	@return  bool     is point in non angled ellipse
--]]
function isPointOnAxisParallelEllipse(x, y, ex, ey, ew, eh)
	return ((x - eh)^2 / ew^2) + ((y - ey)^2 / eh^2) < 1
end

--[[
	Checks if two circles are intersecting

	@param   number   cirle 1 x
	@param   number   cirle 1 y
	@param   number   cirle 1 r
	@param   number   cirle 2 x
	@param   number   cirle 2 y
	@param   number   cirle 2 r
	@return  bool     do circles collide
--]]
function doCirclesIntersect(ax, ay, ar, bx, by, br)
	return (bx - ax)^2 + (by - ay)^2 < (ar + br)^2
end

--[[
	Checks if a circle intersects an axis parallel rectangle

	@param   number   circle x
	@param   number   circle y
	@param   number   circle r
	@param   number   rectangle center x
	@param   number   rectangle center y
	@param   number   rectangle width
	@param   number   rectangle height
	@return  bool     does circle intersect rectangle
--]]
function doesCircleInstersectRectangle(cx, cy, cr, rcx, rcy, rw, rh)
	local circleDistanceX = math.abs(cx - rcx)
	if circleDistanceX > rw / 2 + cr then return false end
	local circleDistanceY = math.abs(cy - rcy)
	if circleDistanceY > rh / 2 + cr then return false end
	if circleDistanceX <= rw / 2 then return true end
	if circleDistanceY <= rh / 2 then return true end
	local cornerDistance_sq = (circleDistanceX - rw / 2)^2 + (circleDistanceY - rh / 2)^2
	return cornerDistance_sq <= cr^2
end
