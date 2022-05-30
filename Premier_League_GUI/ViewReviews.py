import mysql.connector
def View_Reviews(Date):
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
    retrive = "Select * from `fan_rates_match` WHERE Match_Date = %s;"

    #executing the quires
    cursor.execute(retrive, (Date,))
    
    rows = cursor.fetchall()
    
    Review_List = []
    for row in rows:
        Review_List.append(row)
        #print(row)


    #commiting the connection then closing it.
    mydb.close()
    return Review_List
#Player_History("England")