$(function(){
    $('#test').click(function () {
      $(this).text("クリックされました");
    });
  });

function seni(){
    var name = document.form1.namae;
    var passwd = document.form2.passwd;

    if(name == nameCheck() && passwd == passwdCheck()){

    }else{

    }



    location.href = "raid.html";
}