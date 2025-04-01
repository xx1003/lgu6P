products = [
    {
        "category": "Electronics",
        "items": [
            {"name": "Laptop", "price": 1200, "stock": 5},
            {"name": "Smartphone", "price": 800, "stock": 10}
        ]
    },
    {
        "category": "Home Appliances",
        "items": [
            {"name": "Vacuum Cleaner", "price": 150, "stock": 7},
            {"name": "Air Conditioner", "price": 500, "stock": 3}
        ]
    }
]

result = {
    "Laptop": {"price": 1200, "stock": 5},
    "Smartphone": {"price": 800, "stock": 10},
    "Vacuum Cleaner": {"price": 150, "stock": 7},
    "Air Conditioner": {"price": 500, "stock": 3}
}

# 그냥 키 값으로 접근
# def convert_data(products):
#     result_dict = {}
#     for product in products:
#         for item in product["items"]:
#             result_dict[item["name"]] = {
#                 "price":item["price"], 
#                 "stock":item["stock"]
#             }
    
#     return result_dict


# 삼중 for문...?
# def convert_data(products):
#     result_dict = {}
#     for product in products:
#         for item in product["items"]:
#             total = {}
#             for k, v in item.items():
#                 if k != "name":
#                     total[k] = v
#             result_dict[item['name']] = total
            
#     return result_dict


# del 사용한 버전
def convert_data(products):
    result_dict = {}
    for product in products:
        for item in product["items"]:
            name = item['name']
            del item['name']
            result_dict[name] = item
    
    return result_dict

print(convert_data(products))