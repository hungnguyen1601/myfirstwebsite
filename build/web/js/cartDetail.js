var BODY_LIST_ORDER = document.getElementById('BODY_LIST_ORDER')
var KEY_LIST_CART_LOCAL = 'ListCartSelect'
var listCart = JSON.parse(localStorage.getItem(this.KEY_LIST_CART_LOCAL)) || []

document.getElementById("ORDERFORM").addEventListener("click", function (event) {
    event.preventDefault()
});

function fomartMoney(value) {
    if (parseInt(value) >= 1000) {

        return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    } else {
        return value;
    }
}

function bindingDataOder() {
    let HTML = "";
    let total_quantity = 0;
    let total_price = 0;
    console.log(listCart)
    if (this.listCart) {
        this.listCart.forEach(el => {
            HTML += `
                <tr>
                                <td class="text-left">${el.name}</td>
                                <td class="left-10"><span class="priceDetail">${this.fomartMoney(el.price)}</span> $</td>
                                <td class="text-center"><span class="quantytiDetail"> ${el.quantity}</span></td>
                </tr>
                `;
            total_quantity += el.quantity;
            total_price += el.price * el.quantity;
        });
    }
    HTML += `
	<tr class="total">
			<td class="text-center text">Total</td>
			<td class="left-10"><span class="priceTotal">${total_price}</span> $</td>
			<td class="text-center"><span class="quantytiToal">${total_quantity}</span></td>
	</tr>
	`
    this.BODY_LIST_ORDER.innerHTML = HTML;
}

this.bindingDataOder();


function checkPhoneNumber (mobile) {
    var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
    if(mobile !==''){
            if (vnf_regex.test(mobile) == false) 
            {
                alert('Số điện thoại của bạn không đúng định dạng!');
                return false;
            }else{
                return true;
            }
    }else{
        alert('Bạn chưa điền số điện thoại!');
        return false;
    }

}

$('#ORDERFORM').on('keyup keypress', function(e) {
  var keyCode = e.keyCode || e.which;
  if (keyCode === 13) { 
    e.preventDefault();
    return false;
  }
});

$("#txt_Phone").keyup(function(e){ 
    e.preventDefault();
    var code = e.key; // recommended to use e.key, it's normalized across devices and languages
//    if(code==="Enter") e.preventDefault();
    if(code===" " || code==="Enter" || code===","|| code===";"){
       var phoneNumber = e.target.value;
       if(checkPhoneNumber(phoneNumber)){
//           $.ajax({
//		url: 'manageCustomer',
//		type: 'POST',
//		dataType: 'json',
//		data: JSON.stringify(phoneNumber),
//		contentType: 'application/json',
//		mimeType: 'application/json',
//		success: data => {console.log('success::: ,', data);},
//                error: data => {console.log('error::: ,', data);}          
//            });
            location.href = `/Project_Cafe_Final/manageCustomer?action=search&phone=${phoneNumber}`;
       }
    } // missing closing if brace
});

$('#btn_ODER').click(function () {
    var url = "OrderController";
    const data = {
        name: $('#txt_Name').val(),
        address: $('#txt_Address').val(),
        phone: $('#txt_Phone').val(),
        note: $('#txt_Note').val(),
        order: listCart
    };
    if (data.name && data.address && data.phone && data.order) {
        $.ajax({
		url: url,
		type: 'POST',
		dataType: 'json',
		data: JSON.stringify(data),
		contentType: 'application/json',
		mimeType: 'application/json',
		success: data => {console.log('success::: ,', data);},
                error: data => {console.log('error::: ,', data);}          
        });
         localStorage.removeItem(KEY_LIST_CART_LOCAL);
         location.href = "/Project_Cafe_Final/CartDetail.jsp";
         alert('Order successfully !');
    } else {
        alert('You need to enter enough information !');
    }

});

