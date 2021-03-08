

peripheralList = peripheral.getNames()


function manualWireless()
    while true do
        local event, character = os.pullEvent("char")
        if character == "w" then
            rednet.broadcast("w")
            print(character .. ": Moving forward...")
            os.sleep(0.1)
        elseif character == "s" then
            rednet.broadcast("s")
            print(character .. ": Moving backward...")
            os.sleep(0.1)
        elseif character == "a" then
            rednet.broadcast("a")
            print(character .. ": Turning left...")
            os.sleep(0.1)
        elseif character == "d" then
            rednet.broadcast("d")
            print(character .. ": Turning right...")
            os.sleep(0.1)
        elseif character == "z" then
            rednet.broadcast("z")
            print(character .. ": Going down...")
            os.sleep(0.1)
        elseif character == "q" then
            rednet.broadcast("q")
            print(character .. ": Going up...")
            os.sleep(0.1)
        elseif character == "e" then
            rednet.broadcast("e")
            textutils.slowPrint("Terminating manual mode. Standby...")
            rednet.close(peripheralList[i])
            os.sleep(2)
            return
        else
            print("Key not recognized. Use W/A/S/D/Q/Z for movmement and E to exit...")
        end
    end
end

if next(peripheralList) then
    for i = 1, #peripheralList do
        print("There is a "..peripheral.getType(peripheralList[i]).." connected to the \""..peripheralList[i].."\"")
        if peripheral.getType(peripheralList[i]) == "modem" then
            textutils.slowPrint("Activating modem. Standby...")
            os.sleep(2)
            rednet.open(peripheralList[i])
            textutils.slowPrint("Modem powered up, loading boot sequence for manual control. Standby...")
            os.sleep(2)
            manualWireless()
        else
            textutils.slowPrint("No modem found. Terminating bootup...")
            os.sleep(2)
            return
        end
    end
else
    textutils.slowPrint("Could not find any peripherals. Terminating bootup...")
    return
end




