--new Version NOT NEED
function ls()
	local l = file.list()
	for k,v in pairs(l) do
		print("name:"..k..", size:"..v)
	end
end

function cat(filename)
	local line
	file.open(filename, "r")
	while 1 do
		line = file.readline() 
		if line == nil then
			break
		end
		line = string.gsub(line, "\n", "")
		print(line)
	end
	file.close()
end
