local peripheralList = peripheral.getNames()

if next(peripheralList) then
    for i = 1, #peripheralList do
        print("There is a "..peripheral.getType(peripheralList[i]).." connected to the \""..peripheralList[i].."\"")
    end
else
    print("Could not find any peripherals")
end



