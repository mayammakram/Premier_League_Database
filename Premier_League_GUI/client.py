import sys
from AddReviews import AddReview
from PyQt5.QtWidgets import *
from PyQt5.QtWidgets import QMainWindow, QApplication, QPushButton, QWidget, QAction, QTabWidget, QVBoxLayout, QFormLayout, QLabel, QLineEdit
from PyQt5.QtGui import QIcon
#from PyQt5.QtCore import pyqtSlot
from PyQt5 import QtCore, QtGui
from PyQt5.QtGui import *
from PyQt5.QtCore import *
#from PyQt5.QtCore import SIGNAL

from RegisterUser import RegisterUser
from AddReviews import AddReview
from databaseConnector import Player_History
from players import Players
from ViewReviews import View_Reviews
from Player_Positions import Player_Positions
from Teams import Teams
from Top_Teams import Top_TeamsMatches
from Top_TeamsShots import Top_TeamsShots
from TopTeamsByFouls import Top_TeamsFouls
from TopTeamsByYellowCards import Top_TeamsYellow
from Most_Winnings import Most_Winnings
from Team_City import Team_City
from stadium import Stadium

  
# Creating the main window
class App(QMainWindow):
    def __init__(self):
        super().__init__()
        self.title = 'Premier League By: Maya Hussein'
        self.left = 0
        self.top = 0
        self.width = 1000
        self.height = 850
        self.setWindowTitle(self.title)
        self.setGeometry(self.left, self.top, self.width, self.height)
  
        self.tab_widget = MyTabWidget(self)
        self.setCentralWidget(self.tab_widget)
  
        self.show()
  
# Creating tab widgets
class MyTabWidget(QWidget):
    def __init__(self, parent):
        super(QWidget, self).__init__(parent)
        self.layout = QVBoxLayout(self)
  
      # Initialize tab screen
        self.tabs = QTabWidget()
        self.Register = QWidget()
        self.AddReviews = QWidget()
        self.ViewReviews = QWidget()
        self.Players = QWidget()
        self.Player_Positions = QWidget()
        self.Players_History = QWidget()
        self.Teams = QWidget()       
        self.Top_Teams = QWidget()
        self.Most_Winnings = QWidget()        
        self.Team_City = QWidget()
        self.Stadium = QWidget()
        self.tabs.resize(600,600)
        
        # Add tabs
        self.tabs.addTab(self.Register,"Registeration")
        self.tabs.addTab(self.AddReviews,"Add Reviews")
        self.tabs.addTab(self.ViewReviews,"View Reviews")        
        self.tabs.addTab(self.Players,"Players' Information")
        self.tabs.addTab(self.Player_Positions,"Player Positions")
        self.tabs.addTab(self.Players_History,"Player History")
        self.tabs.addTab(self.Teams,"Teams")
        self.tabs.addTab(self.Top_Teams,"Top Teams")
        self.tabs.addTab(self.Most_Winnings,"Most Winnings")
        self.tabs.addTab(self.Team_City,"Team City")
        self.tabs.addTab(self.Stadium,"Stadium")

        
        # Create Registeration tab
        self.Register.layout = QVBoxLayout(self)
        
        # self.label1 = QLabel("Sign Up")
        # self.Register.layout.addWidget(self.label1)
        # self.Register.setLayout(self.Register.layout)
        
        self.line_edit = QLineEdit("Email")
        self.Register.layout.addWidget(self.line_edit)
        self.Register.setLayout(self.Register.layout)
        
        self.line_edit1 = QLineEdit("Username")
        self.Register.layout.addWidget(self.line_edit1)
        self.Register.setLayout(self.Register.layout)
        
        self.line_edit2 = QLineEdit("Gender")
        self.Register.layout.addWidget(self.line_edit2)
        self.Register.setLayout(self.Register.layout)
        
        self.line_edit3 = QLineEdit("Age")
        self.Register.layout.addWidget(self.line_edit3)
        self.Register.setLayout(self.Register.layout)
        
        self.line_edit4 = QLineEdit("Date of Birth")
        self.Register.layout.addWidget(self.line_edit4)
        self.Register.setLayout(self.Register.layout)
        
        self.line_edit5 = QLineEdit("Favorite Team")
        self.Register.layout.addWidget(self.line_edit5)
        self.Register.setLayout(self.Register.layout)
        
        self.RegisterSubmit = QPushButton("Sign Up")        
        def REGISTERBUTTONCLICKED():
            RegisterUser(self.line_edit.text(), self.line_edit1.text(), self.line_edit2.text(), self.line_edit3.text(), self.line_edit4.text(), self.line_edit5.text())
        
        self.RegisterSubmit.clicked.connect(REGISTERBUTTONCLICKED)    
        self.Register.layout.addWidget(self.RegisterSubmit)
        self.Register.setLayout(self.Register.layout)
      
        
        # Create Review tab
        self.AddReviews.layout = QVBoxLayout(self)
        
        self.user = QLineEdit("Username")
        self.AddReviews.layout.addWidget(self.user)
        self.AddReviews.setLayout(self.AddReviews.layout)
        
        self.date = QLineEdit("Match Date")
        self.AddReviews.layout.addWidget(self.date)
        self.AddReviews.setLayout(self.AddReviews.layout)
        
        self.away = QLineEdit("Away Team")
        self.AddReviews.layout.addWidget(self.away)
        self.AddReviews.setLayout(self.AddReviews.layout)
        
        self.home = QLineEdit("Home Team")
        self.AddReviews.layout.addWidget(self.home)
        self.AddReviews.setLayout(self.AddReviews.layout)
        
        self.rev = QLineEdit("Review")
        self.AddReviews.layout.addWidget(self.rev)
        self.AddReviews.setLayout(self.AddReviews.layout)
        
        self.rat = QLineEdit("Rating")
        self.AddReviews.layout.addWidget(self.rat)
        self.AddReviews.setLayout(self.AddReviews.layout)
        
        
        self.ReviewsSubmit = QPushButton("Submit Review")
        
        def REVIEWBUTTONCLICKED():
            AddReview(self.user.text(), self.date.text(), self.away.text(), self.home.text(), self.rev.text(), self.rat.text())
        
        self.ReviewsSubmit.clicked.connect(REVIEWBUTTONCLICKED)    
        self.AddReviews.layout.addWidget(self.ReviewsSubmit)
        self.AddReviews.setLayout(self.AddReviews.layout)
        
        
        #View Reviews
        self.ViewReviews.layout = QVBoxLayout(self)
        #creating push button 
        self.line_editM = QLineEdit("Enter Match Date")
        self.ViewReviews.layout.addWidget(self.line_editM)
        self.ViewReviews.setLayout(self.ViewReviews.layout)
                
        self.b2 = QPushButton("Submit")        # adding action to a button
        
        def button_clicked1():
            
            list3 = View_Reviews(self.line_editM.text())

            self.tableWidgetR = QTableWidget()
            #Row and Column count
            self.tableWidgetR.setRowCount(len(list3)+1) 
            self.tableWidgetR.setColumnCount(6)  

            self.tableWidgetR.setItem(0,0, QTableWidgetItem("Username"))
            self.tableWidgetR.setItem(0,1, QTableWidgetItem("Match Date"))
            self.tableWidgetR.setItem(0,2, QTableWidgetItem("Away Team"))
            self.tableWidgetR.setItem(0,3, QTableWidgetItem("Home Team"))
            self.tableWidgetR.setItem(0,4, QTableWidgetItem("Review"))
            self.tableWidgetR.setItem(0,5, QTableWidgetItem("Rating"))
        
            for i in range(len(list3)):
                item = list3[i]
                for j in range(6):
                    value = item[j]
                    self.tableWidgetR.setItem(i+1,j, QTableWidgetItem(value))

    
            #Table will fit the screen horizontally
            self.tableWidgetR.horizontalHeader().setStretchLastSection(True)
            self.tableWidgetR.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch) 
            
            self.ViewReviews.layout.addWidget(self.tableWidgetR)
            self.ViewReviews.setLayout(self.ViewReviews.layout)
        
        self.b2.clicked.connect(button_clicked1)
        self.ViewReviews.layout.addWidget(self.b2)
        self.ViewReviews.setLayout(self.ViewReviews.layout)
        
        # Player's Tab
        self.Players.layout = QVBoxLayout(self)
        #creating push button 
        self.line_editP = QLineEdit("Enter Name")
        self.Players.layout.addWidget(self.line_editP)
        self.Players.setLayout(self.Players.layout)
                
        self.b1 = QPushButton("Submit")        # adding action to a button
        
        def button_clicked():
            
            list2 = Players(self.line_editP.text())
            self.tableWidgetP = QTableWidget()
            #Row and Column count
            self.tableWidgetP.setRowCount(len(list2)+1) 
            self.tableWidgetP.setColumnCount(8)  

            self.tableWidgetP.setItem(0,0, QTableWidgetItem("Number"))
            self.tableWidgetP.setItem(0,1, QTableWidgetItem("Name"))
            self.tableWidgetP.setItem(0,2, QTableWidgetItem("Position"))
            self.tableWidgetP.setItem(0,3, QTableWidgetItem("Nationality"))
            self.tableWidgetP.setItem(0,4, QTableWidgetItem("Date of Birth"))
            self.tableWidgetP.setItem(0,5, QTableWidgetItem("Height"))
            self.tableWidgetP.setItem(0,6, QTableWidgetItem("Weight"))
            self.tableWidgetP.setItem(0,7, QTableWidgetItem("Club Name"))        
            for i in range(len(list2)):
                item = list2[i]
                for j in range(8):
                    value = item[j]
                    self.tableWidgetP.setItem(i+1,j, QTableWidgetItem(value))

    
            #Table will fit the screen horizontally
            self.tableWidgetP.horizontalHeader().setStretchLastSection(True)
            self.tableWidgetP.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch) 
            
            self.Players.layout.addWidget(self.tableWidgetP)
            self.Players.setLayout(self.Players.layout)
        
        self.b1.clicked.connect(button_clicked)
        self.Players.layout.addWidget(self.b1)
        self.Players.setLayout(self.Players.layout)

        
               
               
        #Player Positions
        self.Player_Positions.layout = QVBoxLayout(self)
        
        self.combobox2 = QComboBox(self)
        Positions  = ["GoalKeeper", "Forward", "Midfielder", "Defender"]
        # adding list of items to combo box
        self.combobox2.addItems(Positions)
        self.Player_Positions.layout.addWidget(self.combobox2)
        self.Player_Positions.setLayout(self.Player_Positions.layout)
        #content = self.combobox2.currentText()
        #print(self.combobox2.count())

        # creating push button 
        self.b4 = QPushButton("Submit")
        
        def button_Clicked2():
            list4 = Player_Positions(self.combobox2.currentText())

            self.tableWidgetPP = QTableWidget()
            #Row count
            self.tableWidgetPP.setRowCount(len(list4)+1) 
            #Column count
            self.tableWidgetPP.setColumnCount(4)  

            self.tableWidgetPP.setItem(0,0, QTableWidgetItem("Number"))
            self.tableWidgetPP.setItem(0,1, QTableWidgetItem("Name"))
            self.tableWidgetPP.setItem(0,2, QTableWidgetItem("Position"))
            self.tableWidgetPP.setItem(0,3, QTableWidgetItem("Nationality"))
            self.tableWidgetPP.setItem(0,4, QTableWidgetItem("Date of Birth"))
            self.tableWidgetPP.setItem(0,5, QTableWidgetItem("Height"))
            self.tableWidgetPP.setItem(0,6, QTableWidgetItem("Weight"))
            self.tableWidgetPP.setItem(0,7, QTableWidgetItem("Club Name")) 
            
            for i in range(len(list4)):
                item = list4[i]
                for j in range(4):
                    value = item[j]
                    self.tableWidgetPP.setItem(i+1,j, QTableWidgetItem(value))

    
            #Table will fit the screen horizontally
            self.tableWidgetPP.horizontalHeader().setStretchLastSection(True)
            self.tableWidgetPP.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch)
            
            self.Player_Positions.layout.addWidget(self.tableWidgetPP)
            self.Player_Positions.setLayout(self.Player_Positions.layout) 
        
        self.b4.clicked.connect(button_Clicked2)
        self.Player_Positions.layout.addWidget(self.b4)
        self.Player_Positions.setLayout(self.Player_Positions.layout)
        

        
        
        #Player's History Tab        
        self.Players_History.layout = QVBoxLayout(self)
        
        self.combobox1 = QComboBox(self)
        Nationalities = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahamas","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Chad","Chile","China","Colombia","Congo","Cook Islands","Costa Rica","Cote D Ivoire","Croatia","Cruise Ship","Cuba","Cyprus","Czech Republic","Denmark","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","England","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Fiji","Finland","France","French Polynesia","French West Indies","Gabon","Gambia","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guam","Guatemala","Guernsey","Guinea","Guinea Bissau","Guyana","Haiti","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Israel","Italy","Jamaica","Japan","Jersey","Jordan","Kazakhstan","Kenya","Kuwait","Kyrgyz Republic","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Macedonia","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Mauritania","Mauritius","Mexico","Moldova","Monaco","Mongolia","Montenegro","Montserrat","Morocco","Mozambique","Namibia","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Poland","Portugal","Puerto Rico","Qatar","Reunion","Romania","Russia","Rwanda","Saint Pierre &amp; Miquelon","Samoa","San Marino","Satellite","Saudi Arabia","Scotland","Senegal","Serbia","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","South Africa","South Korea","Spain","Sri Lanka","St Kitts &amp; Nevis","St Lucia","St Vincent","St. Lucia","Sudan","Suriname","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","Timor L'Este","Togo","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"];
        # adding list of items to combo box
        self.combobox1.addItems(Nationalities)

        self.Players_History.layout.addWidget(self.combobox1)
        self.Players_History.setLayout(self.Players_History.layout)
        
        
        # creating push button 
        self.b5 = QPushButton("Submit")
        
        def Button_Clicked3():
            list1 = Player_History(self.combobox1.currentText())

            self.tableWidget = QTableWidget()
            #Row count
            self.tableWidget.setRowCount(len(list1)+1) 
            #Column count
            self.tableWidget.setColumnCount(4)  

            self.tableWidget.setItem(0,0, QTableWidgetItem("Name"))
            self.tableWidget.setItem(0,1, QTableWidgetItem("Nationality"))
            self.tableWidget.setItem(0,2, QTableWidgetItem("Season"))
            self.tableWidget.setItem(0,3, QTableWidgetItem("Club Name"))
            
            for i in range(len(list1)):
                item = list1[i]
                for j in range(4):
                    value = item[j]
                    self.tableWidget.setItem(i+1,j, QTableWidgetItem(value))

    
            #Table will fit the screen horizontally
            self.tableWidget.horizontalHeader().setStretchLastSection(True)
            self.tableWidget.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch) 
            
            self.Players_History.layout.addWidget(self.tableWidget)
            self.Players_History.setLayout(self.Players_History.layout)
        
        self.b5.clicked.connect(Button_Clicked3)
        self.Players_History.layout.addWidget(self.b5)
        self.Players_History.setLayout(self.Players_History.layout)
        
        
        #Teams Tab
        self.Teams.layout = QVBoxLayout(self)
        #creating push button 
        # self.line_edit = QLineEdit("Enter Club Name")
        # self.Teams.layout.addWidget(self.line_edit)
        # self.Teams.setLayout(self.Teams.layout)
        
        self.comboboxTeams = QComboBox(self)
        ClubTeams = ["Arsenal","Everton","Aston Villa","Crystal Palace","Blackburn Rovers","Chelsea","Leeds United","Manchester City","Middlesbrough","Manchester United","Norwich City","Sheffield Wednesday","Southampton","Bahamas","Tottenham Hotspur","Newcastle United","West Ham United","Leicester City","Watford","Brentdford","Wolverhampton Wanderers","Burnley"];
        # adding list of items to combo box
        self.comboboxTeams.addItems(ClubTeams)

        self.Teams.layout.addWidget(self.comboboxTeams)
        self.Teams.setLayout(self.Teams.layout)
                
        self.b7 = QPushButton("Submit")

        def button_Clicked6():
            list5 = Teams(self.comboboxTeams.currentText())

            self.tableWidgetT = QTableWidget()
            #Row and Column count
            self.tableWidgetT.setRowCount(len(list5)+1) 
            self.tableWidgetT.setColumnCount(3)  

            self.tableWidgetT.setItem(0,0, QTableWidgetItem("Name"))
            self.tableWidgetT.setItem(0,1, QTableWidgetItem("Stadium"))
            self.tableWidgetT.setItem(0,2, QTableWidgetItem("Website"))
        
            for i in range(len(list5)):
                item = list5[i]
                for j in range(3):
                    value = item[j]
                    self.tableWidgetT.setItem(i+1,j, QTableWidgetItem(value))

    
            #Table will fit the screen horizontally
            self.tableWidgetT.horizontalHeader().setStretchLastSection(True)
            self.tableWidgetT.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch) 
            
            self.Teams.layout.addWidget(self.tableWidgetT)
            self.Teams.setLayout(self.Teams.layout)
        
        self.b7.clicked.connect(button_Clicked6)
        self.Teams.layout.addWidget(self.b7)
        self.Teams.setLayout(self.Teams.layout)
        
        
        
        
        #Top Teams Tab
        self.Top_Teams.layout = QVBoxLayout(self)

        #Table 1
        self.tableWidgetTT1 = QTableWidget()
        #Row and Column count
        listMatches = Top_TeamsMatches()
        self.tableWidgetTT1.setRowCount(len(listMatches)+1) 
        self.tableWidgetTT1.setColumnCount(1)  

        self.tableWidgetTT1.setItem(0,0, QTableWidgetItem("Name - Top Teams by Matches"))
       
        for i in range(len(listMatches)):
            item = listMatches[i]
            for j in range(1):
                value = item[j]
                self.tableWidgetTT1.setItem(i+1,j, QTableWidgetItem(value))

   
        #Table will fit the screen horizontally
        self.tableWidgetTT1.horizontalHeader().setStretchLastSection(True)
        self.tableWidgetTT1.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch) 
        
        self.Top_Teams.layout.addWidget(self.tableWidgetTT1)
        self.Top_Teams.setLayout(self.Top_Teams.layout)
        
        #Table 2
        self.tableWidgetTT2 = QTableWidget()

        #Row and Column count
        listFouls = Top_TeamsFouls()
        self.tableWidgetTT2.setRowCount(len(listFouls)+1) 
        self.tableWidgetTT2.setColumnCount(1)  

        self.tableWidgetTT2.setItem(0,0, QTableWidgetItem("Name - Top Teams by Fouls"))
       
        for i in range(len(listFouls)):
            item = listFouls[i]
            for j in range(1):
                value = item[j]
                self.tableWidgetTT2.setItem(i+1,j, QTableWidgetItem(value))

   
        #Table will fit the screen horizontally
        self.tableWidgetTT2.horizontalHeader().setStretchLastSection(True)
        self.tableWidgetTT2.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch) 
        
        self.Top_Teams.layout.addWidget(self.tableWidgetTT2)
        self.Top_Teams.setLayout(self.Top_Teams.layout)
        
        #Table 3
        self.tableWidgetTT3 = QTableWidget()

        #Row and Column count
        listShots = Top_TeamsShots()
        self.tableWidgetTT3.setRowCount(len(listShots)+1) 
        self.tableWidgetTT3.setColumnCount(1)  

        self.tableWidgetTT3.setItem(0,0, QTableWidgetItem("Name - Top Teams by Shots"))
       
        for i in range(len(listShots)):
            item = listShots[i]
            for j in range(1):
                value = item[j]
                self.tableWidgetTT3.setItem(i+1,j, QTableWidgetItem(value))

   
        #Table will fit the screen horizontally
        self.tableWidgetTT3.horizontalHeader().setStretchLastSection(True)
        self.tableWidgetTT3.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch) 
        
        self.Top_Teams.layout.addWidget(self.tableWidgetTT3)
        self.Top_Teams.setLayout(self.Top_Teams.layout)
        
        #Table 4
        self.tableWidgetTT4 = QTableWidget()
        #Row and Column count
        listCards = Top_TeamsYellow()
        self.tableWidgetTT4.setRowCount(len(listCards)+1) 
        self.tableWidgetTT4.setColumnCount(1)  

        self.tableWidgetTT4.setItem(0,0, QTableWidgetItem("Name - Top Teams by Yellow Cards"))
       
        for i in range(len(listCards)):
            item = listCards[i]
            for j in range(1):
                value = item[j]
                self.tableWidgetTT4.setItem(i+1,j, QTableWidgetItem(value))

   
        #Table will fit the screen horizontally
        self.tableWidgetTT4.horizontalHeader().setStretchLastSection(True)
        self.tableWidgetTT4.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch) 
        
        self.Top_Teams.layout.addWidget(self.tableWidgetTT4)
        self.Top_Teams.setLayout(self.Top_Teams.layout)
        
        
        
        #Most_Winnings
        self.Most_Winnings.layout = QVBoxLayout(self)
        
        list7 = Most_Winnings()
        self.tableWidgetM = QTableWidget()
        #Row and Column count
        self.tableWidgetM.setRowCount(len(list7)+1) 
        self.tableWidgetM.setColumnCount(2)  

        self.tableWidgetM.setItem(0,0, QTableWidgetItem("Season"))
        self.tableWidgetM.setItem(0,1, QTableWidgetItem("Club Name"))
       
        for i in range(len(list7)):
            item = list7[i]
            for j in range(2):
                value = item[j]
                self.tableWidgetM.setItem(i+1,j, QTableWidgetItem(value))

   
        #Table will fit the screen horizontally
        self.tableWidgetM.horizontalHeader().setStretchLastSection(True)
        self.tableWidgetM.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch) 
        
        self.Most_Winnings.layout.addWidget(self.tableWidgetM)
        self.Most_Winnings.setLayout(self.Most_Winnings.layout)
        
        
        
        #Team City
        self.Team_City.layout = QVBoxLayout(self) 
        
        self.comboboxTeamCity = QComboBox(self)
        Cities = ["%Liverpool%","%Manchester%","%London%","%Wolverhampton%","%Southampton%","%Lancashire%","%Birmingham%","%Leicester%","%Hertfordshire%","%Brentford%","%Norwich%","%Leeds%","%Newcastle Upon Tyne%"];
        # adding list of items to combo box
        self.comboboxTeamCity.addItems(Cities)
        self.Team_City.layout.addWidget(self.comboboxTeamCity)
        self.Team_City.setLayout(self.Team_City.layout)
                
        self.b8 = QPushButton("Submit")
        
        def teamButton():
            list9 = Team_City(self.comboboxTeamCity.currentText())

            self.tableWidgetTC = QTableWidget()
            #Row count
            self.tableWidgetTC.setRowCount(len(list9)+1) 
            #Column count
            self.tableWidgetTC.setColumnCount(3)  

            self.tableWidgetTC.setItem(0,0, QTableWidgetItem("Club Name"))
            self.tableWidgetTC.setItem(0,1, QTableWidgetItem("Stadium"))
            self.tableWidgetTC.setItem(0,2, QTableWidgetItem("Address"))
            
            for i in range(len(list9)):
                item = list9[i]
                for j in range(3):
                    value = item[j]
                    self.tableWidgetTC.setItem(i+1,j, QTableWidgetItem(value))

    
            #Table will fit the screen horizontally
            self.tableWidgetTC.horizontalHeader().setStretchLastSection(True)
            self.tableWidgetTC.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch) 
            
            self.Team_City.layout.addWidget(self.tableWidgetTC)
            self.Team_City.setLayout(self.Team_City.layout)   
        
        self.b8.clicked.connect(teamButton)
        self.Team_City.layout.addWidget(self.b8)
        self.Team_City.setLayout(self.Team_City.layout)
        
        
        #Stadium Tab
        self.Stadium.layout = QVBoxLayout(self)

        self.comboboxStadium = QComboBox(self)
        Stadiums = [" Anfield"," Etihad Stadium"," Goodison Park"," London Stadium"," Molineux Stadium"," Selhurst Park"," St Mary's Stadium"," Stamford Bridge"," Turf Moor"," Villa Park"," King Power Stadium"," Vicarage Road"," Brentdford Community Stadium", " Carrow Road", " Elland Road", " Ewood Park", " Emirates Stadium", " Tottenham Hotspur Stadium", " Loftus Road Stadium", " Old Trafford", " St. James' Park"];
        # adding list of items to combo box
        self.comboboxStadium.addItems(Stadiums)
        self.Stadium.layout.addWidget(self.comboboxStadium)
        self.Stadium.setLayout(self.Stadium.layout)
                
        self.b9 = QPushButton("Submit")
        
        def stadiumButton():
            list8 = Stadium(self.comboboxStadium.currentText())

            self.tableWidgetS = QTableWidget()
            #Row count
            self.tableWidgetS.setRowCount(len(list8)+1) 
            #Column count
            self.tableWidgetS.setColumnCount(2)  

            self.tableWidgetS.setItem(0,0, QTableWidgetItem("Stadium"))
            self.tableWidgetS.setItem(0,1, QTableWidgetItem("Club Name"))
            
            for i in range(len(list8)):
                item = list8[i]
                for j in range(2):
                    value = item[j]
                    self.tableWidgetS.setItem(i+1,j, QTableWidgetItem(value))

    
            #Table will fit the screen horizontally
            self.tableWidgetS.horizontalHeader().setStretchLastSection(True)
            self.tableWidgetS.horizontalHeader().setSectionResizeMode(QHeaderView.Stretch) 
            
            self.Stadium.layout.addWidget(self.tableWidgetS)
            self.Stadium.setLayout(self.Stadium.layout) 

        self.b9.clicked.connect(stadiumButton)
        self.Stadium.layout.addWidget(self.b9)
        self.Stadium.setLayout(self.Stadium.layout)
        
        
        # Add tabs to widget
        self.layout.addWidget(self.tabs)
        self.setLayout(self.layout)
  
if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = App()
    sys.exit(app.exec_())