local camera = {}

function camera.new()
	return setmetatable({x=32, y=50, scale=64}, {__index=camera})
end

function camera:glideTo(x, y, speed)
	self.x, self.y = (self.x+x*speed)/(1+speed), (self.y+y*speed)/(1+speed)
end

function camera:getPosition()
	return self.x, self.y
end

function camera:toScreenPosition(wx, wy)
	local width, height = love.window.getMode()
	return (wx-self.x)*self.scale+width/2, -(wy-self.y)*self.scale+height/2
end

function camera:toScreenSize(s)
	return s*self.scale
end

function camera:toWorldPosition(sx, sy)
	local width, height = love.window.getMode()
	return (sx-width/2)/self.scale+self.x, (-sy+height/2)/self.scale+self.y
end

function camera:toWorldSize(s)
	return s/self.scale
end

return camera
