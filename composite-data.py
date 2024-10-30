import csv
import copy

myVehicle = {
    "vin" : "<empty>",
    "make" : "<empty>" ,
    "model" : "<empty>" ,
    "year" : 0,
    "range" : 0,
    "topSpeed" : 0,
    "zeroSixty" : 0.0,
    "mileage" : 0
}

for key, value in myVehicle.items():
    print("{} : {}".format(key,value))
    
    myInventoryList = []
    
with open('car_fleet.csv') as csvFile:
    csvReader = csv.reader(csvFile, delimiter=',')  
    lineCount = 0  
    for row in csvReader:   #We are processing each line in the CSV file. Each line is an list type object/data structure
        if lineCount == 0:
            print(f'Column names are: {", ".join(row)}')  #Handling the first row of the CSV file with Column Names in it
            lineCount += 1  
        else:  
            print(f'vin: {row[0]} make: {row[1]}, model: {row[2]}, year: {row[3]}, range: {row[4]}, topSpeed: {row[5]}, zeroSixty: {row[6]}, mileage: {row[7]}')  
            currentVehicle = copy.deepcopy(myVehicle)  #Create a 'deepcopy' temporary variable that hold a temporary 'currentVehicle' of type dictionary
            currentVehicle["vin"] = row[0]  #Each of these lines inserts every column in the current row into the temporary 'currentVehicle' dictionary which starts out empty
            currentVehicle["make"] = row[1]  
            currentVehicle["model"] = row[2]  
            currentVehicle["year"] = row[3]  
            currentVehicle["range"] = row[4]  
            currentVehicle["topSpeed"] = row[5]  
            currentVehicle["zeroSixty"] = row[6]  
            currentVehicle["mileage"] = row[7]  
            myInventoryList.append(currentVehicle)  #Add the currentVehicle dictionary to the initially empty myInventoryList list
            lineCount += 1  
    print(f'Processed {lineCount} lines.')
    
    for myCarProperties in myInventoryList:             #Loop through each of the created dictionaries in the myInventoryList storing it in temporary myCarProperties dictionary
        print("-----")                              #Print a dashed line to separate each car entry
        for key, value in myCarProperties.items():      #Loop through each key-value pair in the temporary myCarPropertiesdictionary
            print("{} : {}".format(key,value))          #Print the currect key-value pair