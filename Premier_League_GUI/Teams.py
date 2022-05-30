import mysql.connector
def Teams(Name):
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
    retrive = "Select *  from `club` WHERE Name = %s;"
    #executing the quires
    cursor.execute(retrive, (Name,))
    
    rows = cursor.fetchall()
    
    club_Info_List = []
    for row in rows:
        club_Info_List.append(row)
        print(row)


    #commiting the connection then closing it.
    mydb.close()
    return club_Info_List


Teams("Arsenal")
