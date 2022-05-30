import mysql.connector
def Top_TeamsYellow():
#database connection
    mydb = mysql.connector.connect(
        host="db4free.net", 
        user="mayamakram", 
        password="A!exandria3", 
        database="pleagueproject"
        )

    cursor = mydb.cursor()

    retrive = "Select Away_Club_Name  from `match` Order By `Yellow Cards` DESC LIMIT 10;"

    #executing the quires
    cursor.execute(retrive)
    
    rows = cursor.fetchall()
    
    club_Info_List = []
    for row in rows:
        club_Info_List.append(row)
        #print(row)


    #commiting the connection then closing it.
    mydb.close()
    return club_Info_List

