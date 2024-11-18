db.createCollection("client", {
  validator: {
    $jsonSchema: {
      "bsonType": "object",
      "title": "client",
      "required": ["name", "data", "register_date", "last_purchase"],
      "properties": {
        "name": {
          "bsonType": "string"
        },
        "data": {
          "bsonType": "object",
          "title": "object",
          "required": ["address", "telephone", "email", "registration_date"],
          "properties": {
            "address": {
              "bsonType": "string"
            },
            "telephone": {
              "bsonType": "string"
            },
            "email": {
              "bsonType": "string"
            },
            "registration_date": {
              "bsonType": "string"
            }
          }  
        },
        "register_date": {
          "bsonType": "date"
        },
        "last_purchase": {
          "bsonType": "object",
          "title": "object",
          "properties": {
            "glasses": {
              "bsonType": "object",
              "title": "object",
              "properties": {
                "brand": {
                  "bsonType": "string"
                },
                "graduation": {
                  "bsonType": "object",
                  "title": "object",
                  "properties": {
                    "graduation L": {
                      "bsonType": "int"
                    },
                    "graduation R": {
                      "bsonType": "int"
                    }
                  }  
                },
                "color": {
                  "bsonType": "object",
                  "title": "object",
                  "properties": {
                    "frame_color": {
                      "bsonType": "string"
                    },
                    "glass_color": {
                      "bsonType": "string"
                    }
                  }  
                },
                "frame_material": {
                  "bsonType": "string"
                },
                "price": {
                  "bsonType": "int"
                }
              }  
            },
            "employee": {
              "bsonType": "string"
            },
            "date": {
              "bsonType": "date"
            }
          }  
        }
      }  
    } 
  }
});
