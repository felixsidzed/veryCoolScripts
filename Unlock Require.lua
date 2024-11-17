getgenv().___require___inner____cache = {}

local getbytecode = (({ identifyexecutor() })[1] == "Xeno" and getscriptbytecode) or function(a)
	return a.Source
end

function require(source)
	print(source, (typeof(source) == "Instance" and source.ClassName) or typeof(source))
	if getgenv().___require___inner____cache[source] then
		return getgenv().___require___inner____cache[source]
	end

	if typeof(source) == "Instance" and (source:IsA("ModuleScript") or source.Name:match("^___require___force_")) then

		local succ, res = loadstring(getbytecode(source))
		if succ and res then
			local module = res()
			getgenv().___require___inner____cache[source] = module
			return module
		else
			if res then error(res)
			else error("failed to get Source property.") end
		end
	elseif typeof(source) == "number" then
		local obj = game:GetObjects("rbxassetid://"..source)[1]
		obj.Name = "___require___force_" .. obj.Name
		return require(obj)
	else
		error("source must be a number or ModuleScript")
	end
end

getgenv().require = require
