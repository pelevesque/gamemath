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
	Wraps an angle in degrees

	Ex: 380 -> 20
	Ex: -725 -> 355

	@param   number   angle
	@return  number   angle
--]]
function wrapAngleInDegrees(angle)
	return angle % 360
end

--[[
	Checks if two circles are colliding

	@param   number   cirle 1 x
	@param   number   cirle 1 y
	@param   number   cirle 1 r
	@param   number   cirle 2 x
	@param   number   cirle 2 y
	@param   number   cirle 2 r
	@return  bool     do circles collide
--]]
function doCirclesCollide(ax, ay, ar, bx, by, br)
	local dx = bx - ax
	local dy = by - ay
	return dx^2 + dy^2 < (ar + br)^2
end
