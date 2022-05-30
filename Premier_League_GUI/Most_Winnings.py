import mysql.connector
def Most_Winnings():
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
    retrive = "Select Away_Club_Name, Season from `match`;"#Group By Season Having MAX(`Result T1`);"
    #executing the quires
    cursor.execute(retrive)
    
    rows = cursor.fetchall()
    
    Most_Winnings_List = []
    for row in rows:
        Most_Winnings_List.append(row)
        print(row)


    #commiting the connection then closing it.
    mydb.close()
    return Most_Winnings_List

Most_Winnings()
