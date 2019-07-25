$(function(){
    $('#test').click(function () {
      $(this).text("クリックされました");
    });
  });

function mover(){
    document.value = "POKEMON GO"
}

function seni(){
    var name = document.form1.namae;
    var passwd = document.form2.passwd;
    alert(name);
    /*
    if(name == nameCheck() && passwd == passwdCheck()){

    }else{

    }*/

    window.location.href = "raid.html";
}