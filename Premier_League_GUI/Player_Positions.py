import mysql.connector
def Player_Positions(Position):
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
    retrive = "Select *  from `player` WHERE Position = %s;"

    #executing the quires
    cursor.execute(retrive, (Position,))
    
    rows = cursor.fetchall()
    
    player_Info_List = []
    for row in rows:
        player_Info_List.append(row)
        #print(row)


    #commiting the connection then closing it.
    mydb.close()
    return player_Info_List

#Players("Mohamed Salah")