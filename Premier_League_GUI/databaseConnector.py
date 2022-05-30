import mysql.connector
def Player_History(Nationality):
#database connection
    mydb = mysql.connector.connect(
        host="db4free.net", 
        user="mayamakram", 
        password="A!exandria3", 
        database="pleagueproject"
        )

    cursor = mydb.cursor()
    # if (mydb):
    #     print("Successful\n")
    # else:
    #     print("Failed\n")
    
    # queries for retrievint all rows
    #Show all the players from a certain nationality and their home teams history
    retrive = "Select Name, Nationality, Season, `Club Name` from `player`, `seasons` WHERE Nationality = %s AND Player_Number = Name AND Player_Name = Number;"

    #executing the quires
    cursor.execute(retrive, (Nationality,))
    
    rows = cursor.fetchall()
    
    player_Nationality_List = []
    for row in rows:
        player_Nationality_List.append(row)
        #print(row)


    #commiting the connection then closing it.
    mydb.close()
    return player_Nationality_List
#Player_History("England")