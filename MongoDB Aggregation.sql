# Run the below command on the newly opened terminal
mongosh -u root -p PASSWORD --authenticationDatabase admin local


# In MongoDB CLI (i.e. mongo shell), switch the context to training database.
In MongoDB CLI (i.e. mongo shell), switch the context to training database.

# And create a collection called bigdata
use training
db.marks.insert({"name":"Ramesh","subject":"maths","marks":87})
db.marks.insert({"name":"Ramesh","subject":"english","marks":59})
db.marks.insert({"name":"Ramesh","subject":"science","marks":77})
db.marks.insert({"name":"Rav","subject":"maths","marks":62})
db.marks.insert({"name":"Rav","subject":"english","marks":83})
db.marks.insert({"name":"Rav","subject":"science","marks":71})
db.marks.insert({"name":"Alison","subject":"maths","marks":84})
db.marks.insert({"name":"Alison","subject":"english","marks":82})
db.marks.insert({"name":"Alison","subject":"science","marks":86})
db.marks.insert({"name":"Steve","subject":"maths","marks":81})
db.marks.insert({"name":"Steve","subject":"english","marks":89})
db.marks.insert({"name":"Steve","subject":"science","marks":77})
db.marks.insert({"name":"Jan","subject":"english","marks":0,"reason":"absent"})

# Limiting the rows in the output.
use training
db.marks.aggregate([{"$limit":2}])


#  Sorting based on a column
db.marks.aggregate([{"$sort":{"marks":1}}])
or
72


#  Sorting and limiting:
db.marks.aggregate([
    {"$sort":{"marks":-1}},
    {"$limit":2}
])


# Group by :
db.marks.aggregate([
{
    "$group":{
        "_id":"$subject",
        "average":{"$avg":"$marks"}
    }
}
])



#  Putting it all together
db.marks.aggregate([
    {
        "$group":{
            "_id":"$name",
            "average":{"$avg":"$marks"}
            }
    },
    {
        "$sort":{"average":-1}
    },
    {
        "$limit":2
    }
])