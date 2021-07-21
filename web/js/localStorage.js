var listCartTest = [{
        "id": "trachanh",
        "name": "Tra chanh",
        "quantity": 2,
        "image": "https://www.foodpanda.vn/wp-content/uploads/2019/04/6-640x500.jpg",
        "price": 15000
    },
    { "id": "nuocam", "name": "Nước cam", "quantity": 1, "image": "https://www.foodpanda.vn/wp-content/uploads/2019/04/6-640x500.jpg", "price": 20000 },
    { "id": "sodablue", "name": "Soda Blue", "quantity": 1, "image": "https://www.foodpanda.vn/wp-content/uploads/2019/04/6-640x500.jpg", "price": 23000 },
    { "id": "trasua", "name": "Trà sữa", "quantity": 1, "image": "https://www.foodpanda.vn/wp-content/uploads/2019/04/6-640x500.jpg", "price": 23000 }
]

function saveToLocalStorage() {
    if (!localStorage.getItem('ListCartSelect')) {
        localStorage.setItem('ListCartSelect', JSON.stringify(this.listCartTest))
    }
}
saveToLocalStorage()