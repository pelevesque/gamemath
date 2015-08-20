--[[
Title:     LuaGameMath - Trigonometry
Version:   1.0
Author:    Pierre-Emmanuel Lévesque
Email:     pierre.e.levesque@gmail.com
Created:   October 14th, 2013
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
	Reflects an angle in degrees off a plane

	@param   number   attack angle (degrees)
	@param   number   plane angle (degrees)
	@return  number   reflected angle (degrees)
--]]
function reflectAngleInDegrees(attackAngle, planeAngle)
	return ((2 * planeAngle) - attackAngle) % 360
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
	return (math.atan2(y2 - y1, x2 - x1) * 180 / math.pi) % 360
end

--[[
	Gets a line's angle in radians from its points

	@param   number   x1
	@param   number   y1
	@param   number   x2
	@param   number   y2
	@return  number   angle (radians)
--]]
function getLineAngleInRadiansFromPoints(x1, y1, x2, y2)
	return math.atan2(y2 - y1, x2 - x1) % (math.pi * 2)
end

--[[
	Gets the Hypothenuse's length using Pythagore's formula

	@param   number   a side
	@param   number   b side
	@return  number   Hypothenuse's length
--]]
function getHypotenuseLength(a, b)
	return math.sqrt(a^2 + b^2)
end

--[[
	Gets the Cathetus's length using Pythagore's formula

	@param   number   hypothenuse
	@param   number   a side (the other cathetus)
	@return  number   cathetus's length
--]]
function getCathetusLength(h, a)
	return math.sqrt(h^2 - a^2)
end

--[[
	Gets the distance between two points using Pythagore's formula

	@param   number   x1
	@param   number   y1
	@param   number   y1
	@param   number   y2
	@return  number   distance
--]]
function getDistanceBetweenPoints(x1, y1, x2, y2)
	return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end
