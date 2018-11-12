function check() {

    var cbox = input_form.chk;
        
    if (cbox.length) { // 여러 개일 경우
        for (var i = 0; i < cbox.length; i++) {
            cbox[i].checked = input_form.all.checked;
        }
    } else { // 한 개일 경우
        cbox.checked = input_form.all.checked;
    }
    
};

function plus() {
    
    var text = document.getElementById('count_text').value;
    var num_text = Number(text)+1;
    document.getElementById('count_text').value = num_text;    

};

function minus() {
    
    var text = document.getElementById('count_text').value;
    var num_text = Number(text)-1;
    
    if(num_text > 0) {
        document.getElementById('count_text').value = num_text;
    }
    
};

function change_money () {
  
    var delivery = 2500;
    var money_sum = 5000;
    var text = document.getElementById('count_text').value;
    var ntext = Number(text);
    
    var goods_sum = money_sum * ntext;
    document.getElementById('goods_money_sum').innerHTML = goods_sum;

    var money_payment = goods_sum + delivery;
    document.getElementById('goods_money_payment').innerHTML = money_payment;
    
};