student = {
    "074":{
        "name":"Nidhi CP",
        "branch":"ISE",
        "sem":"5",
    },
    "075":{
        "name":"Nikhil",
        "branch":"ISE",
        "sem":"5",
    },
    "076":{
        "name":"Nikhil T",
        "branch":"ISE",
        "sem":"5",
    },
    "077":{
        "name":"Nimish",
        "branch":"ISE",
        "sem":"5",
    },
    "078":{
        "name":"Pavani",
        "branch":"ISE",
        "sem":"5",
    },
    "079":{
        "name":"Pooja",
        "branch":"ISE",
        "sem":"5",
    }
}

for i in student:
    if int(i)%2 == 0:
        print(i,student[i])