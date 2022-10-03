let numbtn = $(".button");
let dis = $(".text");
let dec = $("#dec");
let eq = $("#eq");
let ac = $("#ac");
let ope = $(".ope")
let plus = $(".plus")
let min = $(".minus")
let mul = $(".multiply")
let divi = $(".division")
let zero = $(".zero")
let dbzero = $(".doublezero")

let opeflg = true; //演算子が使えるかの判断用フラグ
let decflg = false; //小数点が使えるかの判断用フラグ
let second = false; //一度計算を行った後かの判断用フラグ
let number1,number2; //計算用数字の格納用変数
let calc; //計算式タイプの格納用変数
let op; //演算子を格納する変数
let result; //計算結果を格納する変数

//全ての表示を消す関数
function allclear(){
  dis.text('');
  decflg = false;
  number1 = number2 = calc = '';
}

//ディスプレイに表示する関数
function output(i){
  let j = dis.text();
  dis.text(j+i);
}

//表示されている数字をnumber1に保存してdis2の表示を消す関数
function save(){
  number1 = dis.text();
  dis.text('');
}

//数字ボタンをクリックした時の処理
numbtn.click(function(){
  if(second == true) {
    allclear();
    second = false;
  }
  if(dis.text() == '0'){ //ディスプレイが0の時に数字を押すとディスプレイを空にする処理
    dis.text('');
  }
  let moji = $(this).text();
  output(moji);
  opeflg = false;
});

//「小数点ボタン」処理
dec.click(function(){
  if(decflg == false) {
    if(second == true) {
      allclear();
      second = false;
    }
    let moji = $(this).text();
    output(moji);
    decflg = true;
    opeflg = false;
  }
});

//「ACボタン」処理
ac.click(function(){
  allclear();
});

//ディスプレイが｢0｣の時に0を押した場合に0を増やさない処理
zero.click(function(){
  if(second == true) {
    allclear();
    second = false;
  }
  if(dis.text() == ''){
    let moji = $(this).text();
    output(moji);
    opeflg = false;
  } else if(dis.text() != '0'){
    let moji = $(this).text();
    output(moji);
    opeflg = false;
  }
});

//ディスプレイが空の時に00を押した場合に0を一つだけ表示させる処理
dbzero.click(function(){
  if(second == true) {
    allclear();
    second = false;
  }
  if(dis.text() == ''){
    let moji = 0;
    output(moji);
    opeflg = false;
  } else if(dis.text() != '0'){
    let moji = $(this).text();
    output(moji);
    opeflg = false;
  }
});

//足し算用関数
plus.click(function(){
  if(opeflg == false){
    save();
    op = plus.text();
    output(op);
    calc = 1;
    second = decflg = false;
    opeflg = true;
  }
});

//引き算用関数
min.click(function(){
  if(opeflg == false){
    save();
    op = min.text();
    output(op);
    calc = 2;
    second = decflg = false;
    opeflg = true;
  }
});

//掛け算用関数
mul.click(function(){
  if(opeflg == false){
    save();
    op = mul.text();
    output(op);
    calc = 3;
    second = decflg = false;
    opeflg = true;
  }
});

//割り算用関数
divi.click(function(){
  if(opeflg == false){
    save();
    op = divi.text();
    output(op);
    calc = 4;
    second = decflg = false;
    opeflg = true;
  }
});

//「＝ボタン」処理のswitch構文
eq.click(function(){
  number2 = dis.text();
  switch(calc){
    case 1:
      result = Number(number1) + Number(number2);
      dis.text(result);
      decflg = false;
      second = true;
      console.log(calc);
      break;
    case 2:
      result = Number(number1) - Number(number2);
      dis.text(result);
      decflg = false;
      second = true;
      console.log(calc);
      break;
    case 3:
      result = Number(number1) * Number(number2);
      dis.text(result);
      decflg = false;
      second = true;
      console.log(calc);
      break;
    case 4:
      result = Number(number1) / Number(number2);
      dis.text(result);
      decflg = false;
      second = true;
      console.log(calc);
      break;
    default:
      console.log("miss");
      console.log(calc);
  }
});

/*「＝ボタン」処理のif構文（コメントアウト中）
eq.click(function(){
  number2 = dis.text();
  if(calc = 1) {
    result = Number(number1) + Number(number2);
  } else if(calc = 2) {
    result = Number(number1) - Number(number2);
  } else if(calc = 3) {
    result = Number(number1) * Number(number2);
  } else if(calc = 4) {
    result = Number(number1) / Number(number2);
  }
  dis.text(result);
  decflg = false;
  second = true;
}); */