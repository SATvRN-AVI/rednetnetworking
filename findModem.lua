function findModem()
    if peripheral.isPresent("true") then
        peripheral.find("modem").open(1)
        print("Modem Found!")
    else
        print("Please install a modem on this device")
    end
end

findModem()