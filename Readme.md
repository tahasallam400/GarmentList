>>create this app with MVVM because MVVM divide the app better than MVC and MVP and better during write 
Unit Test 

>> DataLayer create the database with CoreData framework because it is fast and provided by apple and it gives us the ability to managing the object graphs within the object I make an extension and I create the method that I need like fetch, delete, isNameExistBefore , list, sort by(alphabetic, creation date)


>>Helper contain anything extra the app need like {
String Extension >> that app use to make it localizable and if this string used in more than one location in the application and need to change it we will change it from one location to other localizable  

Enum >> i used enum to select the type of sort because not easy to remember the number in the segment as an example if selectedIndex in it 0 what it mean or 1 so enum help anyone to understand the code easier

ViewModelHelper >> this required for MVVM as DynamicValue it uses observer pattern in it 

}



>>View Folder contains 3 sections {

Storyboard 
Cell >> this file contain any cell maybe I will use it in another location in the app I used Nib file with it 
LaunchScreen 

}



>>Controller Folder Contain 2 Section 
GarmentList >> used to display Garment TableView with two option of display order by Alphabetic or by creation date contain every part related to it mean (ViewModel,DataSource,Controller,Delegate) {

Delegate>>it contain on delegate used when we add new data in other Views it give the order to refresh the current view to show use the update

DataSource>>it is the data source for the table  view and we update it with data changed with the observer pattern 

ViewModel>> contains the method that responsible for fetching data with the option from enumeration SortOption maybe by Alphabetic or by creation date and store it in the list which uses KVO

Controller >> contain simple method use to configure UI and event of segment and configureViewModel and implement the Delegate in it 
}


GarmentAdd used to add new Garment With name and creation date it contains only (ViewModel, controller) {
ViewModel >> contains the only method used to add a new garment with a name and to make sure this name did not exist before 
controller >> used to show view contains the text to write the name of the garment and title and button when the user press on it save the data with ViewModel and with delegate it sends for the GarmentList to update the data 
}



>>Technical Assessment Tests I wrote UITest for some parts no all the app it Cover %64 from the app 

