import mysql.connector
def Team_City(Name):
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
    retrive = "SELECT c.Name, s.Name, Address FROM club c, stadium s WHERE c.Stadium_Home_Name = s.Name AND Address LIKE %s;"
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


Team_City('%London%')

