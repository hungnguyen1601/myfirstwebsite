var cartButton = document.getElementById('cart')
var cartDetail = document.getElementById('cartDetail')
var MODAL = document.getElementById('modal')
var closeButton = document.getElementById('closeButton')
var bodyTableListCart = document.getElementById('bodyTableListCart')
var UNSHOW = 'UNSHOW'
var KEY_LIST_CART_LOCAL = 'ListCartSelect'
var listCart = JSON.parse(localStorage.getItem(this.KEY_LIST_CART_LOCAL)) || []
var TOTAL_QUANTITY = document.getElementById('TOTAL_QUANTITY')
var TOTAL_PRICE = document.getElementById('TOTAL_PRICE')
var TOTAL_CART_NUM = document.getElementById('totalNumberCart')
var BODY_LIST_ORDER = document.getElementById('BODY_LIST_ORDER')

function fomartMoney(value) {
    if (parseInt(value) >= 1000) {

        return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    } else {
        return value;
    }
}

function updateLocalStorage() {
    localStorage.setItem(this.KEY_LIST_CART_LOCAL, JSON.stringify(this.listCart))
}

function bindingData() {
    let HTML = "";
    let total_quantity = 0;
    let total_price = 0;
    if (this.listCart) {
        this.listCart.forEach(el => {
            console.log('bindingData  el ::: ',el)
            HTML += `
                    <tr>
                            <td class="infoName">
                                    <p>${el.name}</p>
                            </td>
                            <td class="infoPrice">
                                    <p><span>${this.fomartMoney(el.price)}</span> $</p>
                            </td>
                            <td class="infoQuantity">
                                    <div class="detailQuantity">
                                            <button class="sub" onclick="onChangeQuantity('${el.id}', 'sub')" >-</button>
                                            <p>
                                                ${el.quantity}
                                            </p>
                                            <button class="sup" onclick="onChangeQuantity('${el.id}', 'sup')">+</button>
                                    </div>
                            </td>
                            <td class="acction"><a class="removeProduct" onclick="removeItemCart('${el.id}')"><i class="fa fa-times-circle" aria-hidden="true"></i></a></td>
                    </tr>
                    `;
            total_quantity += el.quantity;
            total_price += el.price * el.quantity;
        });
    }
    this.bodyTableListCart.innerHTML = HTML;
    this.TOTAL_QUANTITY.innerHTML = total_quantity
    this.TOTAL_CART_NUM.innerHTML = total_quantity
    this.TOTAL_PRICE.innerHTML = this.fomartMoney(total_price)
    if (total_quantity == 0) {
        this.cartButton.classList.add(this.UNSHOW)
    } else if (total_price > 0) {
        this.cartButton.classList.remove(this.UNSHOW)
    }
}
this.bindingData()


function showCart(isShow) {
    if (isShow) {
        this.bindingData()
        this.cartDetail.classList.remove(this.UNSHOW)
        this.MODAL.classList.remove(this.UNSHOW)
        return
    }
    this.cartDetail.classList.add(this.UNSHOW)
    this.MODAL.classList.add(this.UNSHOW)
}

cartButton.addEventListener('click', () => { this.showCart(true) })
closeButton.addEventListener('click', () => { this.showCart(false) })
MODAL.addEventListener('click', () => { this.showCart(false) })

function removeItemCart(id) {
    let p = this.listCart.find(x => x.id == id)
    if (confirm(`Do you want to delete "${p.name}" from cart ?`)) {
        if (p) {
            const index = this.listCart.findIndex(x => x.id == id)
            this.listCart.splice(index, 1)
        }
    }
    this.updateLocalStorage()
    this.bindingData()
}

function onChangeQuantity(id, action) {
    console.log('onChangeQuantity ', id, ' - ', action)
    if (action == 'sub') {
        let p = this.listCart.find(x => x.id == id)
        console.log('zozoz ::: ', p)
        if (p.quantity == 1) {
            this.removeItemCart(id)
        } else {
            p.quantity -= 1
        }
    } else if (action == 'sup') {
        let p = this.listCart.find(x => x.id == id)
        console.log('zozoz ::: ', p)
        p.quantity += 1
    }
    this.updateLocalStorage()
    this.bindingData()
}

function addToCart(product) {
    console.log(this.listCart)
    let itemSelect = {
        id: product.id,
        name: product.name,
        quantity: 1,
        price: product.price
    };

    if (this.listCart) {
        const itemSlected = this.listCart.find(x => x.id == itemSelect.id)

        if (itemSlected) {
            itemSlected.quantity += 1
            console.log("itemSlected ::: ", itemSlected, this.listCart, itemSelect)
        } else {
            this.listCart.push(itemSelect)
        }
    } else {
        this.listCart.push(itemSelect)
    }
    this.updateLocalStorage()
    this.bindingData()
}

function addListToCart(list) {
    list.forEach(i => {
        this.addToCart(i);
    })
}
