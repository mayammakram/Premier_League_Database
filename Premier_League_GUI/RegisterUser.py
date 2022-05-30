import mysql.connector
def RegisterUser(email, username, gender, age, club, DOB):
    #database connection
    mydb = mysql.connector.connect(
        host="db4free.net", 
        user="mayamakram", 
        password="A!exandria3", 
        database="pleagueproject"
        )

    cursor = mydb.cursor()
    data = [(username, email, gender, age, DOB, club)]
    
    send = "INSERT INTO fan(Username,Email,Gender,Age,DOB,`Favorite Team`) VALUES (%s,%s,%s,%s,%s,%s)"
    cursor.executemany(send, data)
    mydb.commit()


    #commiting the connection then closing it.
    mydb.close()
