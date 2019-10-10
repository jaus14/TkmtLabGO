$(function(){
    $('#test').click(function () {
      $(this).text("クリックされました");
    });
  });

function mover(){
    document.value = "POKEMON GO"
}

function seni(){
    var name = document.getElementById('name').value;;
    var passwd = document.getElementById('passwd').value;;
    alert(name);
    alert(passwd);
    if(check(name,passwd)){

      window.location.href = "main.html"
    }else{
      alert("パスワードが違います。")
    }

}

function check(name,passwd){
  //名前とパスワードが一致しているかどうか確認する処理
  return true;
}