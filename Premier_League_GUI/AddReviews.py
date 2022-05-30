import mysql.connector
def AddReview(username, date, awayTeam, homeTeam, review, rating):
    #database connection
    mydb = mysql.connector.connect(
        host="db4free.net", 
        user="mayamakram", 
        password="A!exandria3", 
        database="pleagueproject"
        )

    cursor = mydb.cursor()
    data = [(username, date, awayTeam, homeTeam, review, rating)]
    
    send = "INSERT INTO fan_rates_match(Fan_Username,Match_Date,Match_Away_Club_Name,Match_Home_Club_Name,Review,Rating) VALUES (%s,%s,%s,%s,%s,%s)"
    cursor.executemany(send, data)
    mydb.commit()


    #commiting the connection then closing it.
    mydb.close()
