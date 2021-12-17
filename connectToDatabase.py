import mysql.connector as mysql

db = mysql.connect(
    host = "localhost",
    user = "ShopOwner",
    passwd = "ShopOwner",
    database = "posDb"
)

cursor = db.cursor()

## defining the Query
query = "SELECT itemName,SellingPrice FROM Sale"

## getting 'productInfo' column from the table
cursor.execute(query)

## fetching all usernames from the 'cursor' object
productInfo = cursor.fetchall()

## Showing the data
for productInfo in productInfo:
    print(productInfo)

