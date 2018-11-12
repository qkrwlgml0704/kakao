function plus() {
    
    var mmoney = document.getElementById('money');
    var sm =document.getElementById('saveMoney');
    var num = Number(salePrice.innerHTML);
    var mtext = document.getElementById('text').value;
    var num_text = Number(mtext)+1;
    var mum = Number(mmoney.innerHTML);
    
    document.getElementById('text').value = num_text;    
    mum = mum + num;
    mmoney.innerHTML = mum;
    sm.innerHTML  = mum/100;
}

function minus() {
   
    var mmoney = document.getElementById('money');
    var sm =document.getElementById('saveMoney');
    var num = Number(salePrice.innerHTML);
    var mtext = document.getElementById('text').value;
    var num_text = Number(mtext)-1;
    var mum = Number(mmoney.innerHTML);
    
    if(num_text > 0) {
        document.getElementById('text').value = num_text;
        mum = mum - num;
        mmoney.innerHTML = mum;
        sv.inherHTML = mum/100;
    }
    
};

function basket_move() {
    var con_basket = confirm('장바구니로 이동하시겠습니까 ?');
    
    if(con_basket == true) {
        location.href = "shopping_basket.jsp";
    } else if(con_basket == false) {
    	location.href = "shopping.jsp";
    }
}