dofile('cmd.lua')
id="yourid" --you can set your id by youself!!!!!!
function startServer()
print(wifi.sta.getip())
sk=net.createConnection(net.TCP, 0)

sk:on("receive", function(sck, c) node.input(c) end )   --print(c)

sk:on("connection", function(sck, c) 
print(c)
sk:send(id)
function s_output(str)
         if (sk~=nil and str~='')    then
            sk:send(str)
         end
      end
node.output(s_output,1)
end )
sk:on("disconnection",function(conn,c) 
         --node.output(nil) 
		 print('reconnect')
		 sk:connect(8001,"www.mcunode.com")
		 sk:send(id)
      end)
sk:connect(8001,"www.mcunode.com")
end
wifi.setmode(wifi.STATION)
wifi.sta.config("wifissid","wifipassword")    --set your ap info !!!!!!
wifi.sta.autoconnect(1)
tmr.alarm(1, 1000, 1, function() 
   if wifi.sta.getip()==nil then
      print("Connect AP, Waiting...") 
   else
      startServer()
      tmr.stop(1)
   end
end)
