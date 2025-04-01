orders = [
    {
        "country": "USA",
        "customers": [
            {
                "customer_id": "C001",
                "orders": [
                    {"product": "Laptop", "quantity": 1, "unit_price": 1200},
                    {"product": "Mouse", "quantity": 2, "unit_price": 25}
                ]
            },
            {
                "customer_id": "C002",
                "orders": [
                    {"product": "Smartphone", "quantity": 1, "unit_price": 800}
                ]
            }
        ]
    },
    {
        "country": "Canada",
        "customers": [
            {
                "customer_id": "C003",
                "orders": [
                    {"product": "Laptop", "quantity": 2, "unit_price": 1150},
                    {"product": "Keyboard", "quantity": 1, "unit_price": 100}
                ]
            }
        ]
    }
]


result = {
    "C001": {
        "country": "USA",
        "products": ["Laptop", "Mouse"],
        "total_amount": 1250  # (1 x 1200) + (2 x 25)
    },
    "C002": {
        "country": "USA",
        "products": ["Smartphone"],
        "total_amount": 800
    },
    "C003": {
        "country": "Canada",
        "products": ["Laptop", "Keyboard"],
        "total_amount": 2400  # (2 x 1150) + (1 x 100)
    }
}

def order_by_customers(orders):
    result = {}
    for order in orders:    # order : dict
        country = order["country"]
        for info in order["customers"]:   # order["customer"] : list, info : dict 
            id = info["customer_id"]

            # product_temp = []
            # total_amount = 0
            # for product in info["orders"]:  # info["orders"] : list, product : dict
            #     product_temp.append(product["product"])
            #     total_amount += product["quantity"] * product["unit_price"]
            
            # lambda 방식이 요즘 더 많이 씀!!! 
            product_temp = [product["product"] for product in info["orders"]]
            total_amount = sum(
                [
                    product["quantity"] * product["unit_price"] for product in info["orders"]
                ]
            )

            result[id] = {
                "country":country,
                "products":product_temp,
                "total_amount":total_amount
            }

    return result

dict = order_by_customers(orders)

import json
print(json.dumps(dict, indent=4))