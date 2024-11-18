db.createCollection("glasses", {
  validator: {
    $jsonSchema: {
      "bsonType": "object",
      "title": "glasses",
      "required": ["brand", "frame_material", "price", "bought_by", "supplier"],
      "properties": {
        "brand": {
          "bsonType": "string"
        },
        "frame_material": {
          "bsonType": "string"
        },
        "price": {
          "bsonType": "int"
        },
        "bought_by": {
          "bsonType": "object",
          "title": "object",
          "properties": {
            "name": {
              "bsonType": "string"
            },
            "postal_code": {
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
            },
            "recommended_by_ID": {
              "bsonType": "string"
            }
          }  
        },
        "supplier": {
          "bsonType": "object",
          "title": "object",
          "properties": {
            "name": {
              "bsonType": "string"
            },
            "address": {
              "bsonType": "object",
              "title": "object",
              "properties": {
                "country": {
                  "bsonType": "string"
                },
                "city": {
                  "bsonType": "string"
                },
                "street": {
                  "bsonType": "string"
                },
                "building": {
                  "bsonType": "string"
                },
                "floor": {
                  "bsonType": "string"
                },
                "door": {
                  "bsonType": "string"
                }
              }  
            },
            "telephone": {
              "bsonType": "string"
            },
            "fax nif": {
              "bsonType": "string"
            }
          }  
        }
      }  
    } 
  }
});
