db.createCollection("Store", {
  validator: {
    $jsonSchema: {
      "bsonType": "object",
      "title": "Store",
      "required": ["address", "postal_code", "locality", "province", "order", "worker"],
      "properties": {
        "address": {
          "bsonType": "string"
        },
        "postal_code": {
          "bsonType": "string"
        },
        "locality": {
          "bsonType": "string"
        },
        "province": {
          "bsonType": "string"
        },
        "order": {
          "bsonType": "object",
          "title": "object",
          "required": ["order_id", "product", "day_and_time", "client", "takeout_or_delivery", "price"],
          "properties": {
            "order_id": {
              "bsonType": "string"
            },
            "product": {
              "bsonType": "object",
              "title": "object",
              "required": ["product_id", "name", "type", "quantity", "description", "image", "price"],
              "properties": {
                "product_id": {
                  "bsonType": "string"
                },
                "name": {
                  "bsonType": "string"
                },
                "type": {
                  "bsonType": "object",
                  "title": "object",
                  "properties": {
                    "pizza": {
                      "bsonType": "object",
                      "title": "object",
                      "required": ["category"],
                      "properties": {
                        "category": {
                          "bsonType": "string"
                        }
                      }  
                    },
                    "burger": {
                      "bsonType": "string"
                    },
                    "drink": {
                      "bsonType": "string"
                    }
                  }  
                },
                "quantity": {
                  "bsonType": "int"
                },
                "description": {
                  "bsonType": "string"
                },
                "image": {
                  "bsonType": "string"
                },
                "price": {
                  "bsonType": "int"
                }
              }  
            },
            "day_and_time": {
              "bsonType": "timestamp"
            },
            "client": {
              "bsonType": "object",
              "title": "object",
              "required": ["client_id", "name", "surname", "telephone", "order_type"],
              "properties": {
                "client_id": {
                  "bsonType": "string"
                },
                "name": {
                  "bsonType": "string"
                },
                "surname": {
                  "bsonType": "string"
                },
                "telephone": {
                  "bsonType": "string"
                },
                "order_type": {
                  "bsonType": "object",
                  "title": "object",
                  "required": ["takeout", "delivery"],
                  "properties": {
                    "takeout": {
                      "bsonType": "string"
                    },
                    "delivery": {
                      "bsonType": "object",
                      "title": "object",
                      "required": ["address", "postal_code", "locality", "province", "delivery_time", "delivery_employee_id"],
                      "properties": {
                        "address": {
                          "bsonType": "string"
                        },
                        "postal_code": {
                          "bsonType": "string"
                        },
                        "locality": {
                          "bsonType": "string"
                        },
                        "province": {
                          "bsonType": "string"
                        },
                        "delivery_time": {
                          "bsonType": "timestamp"
                        },
                        "delivery_employee_id": {
                          "bsonType": "string"
                        }
                      }  
                    }
                  }  
                }
              }  
            },
            "takeout_or_delivery": {
              "bsonType": "bool"
            },
            "price": {
              "bsonType": "int"
            }
          }  
        },
        "worker": {
          "bsonType": "object",
          "title": "object",
          "required": ["employee_id", "name", "lastname", "nif", "telephone", "role"],
          "properties": {
            "employee_id": {
              "bsonType": "string"
            },
            "name": {
              "bsonType": "string"
            },
            "lastname": {
              "bsonType": "string"
            },
            "nif": {
              "bsonType": "string"
            },
            "telephone": {
              "bsonType": "string"
            },
            "role": {
              "bsonType": "string"
            }
          }  
        }
      }  
    } 
  }
});
