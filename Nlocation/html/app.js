window.addEventListener('message', function(event) {

  var v = event.data

  switch(v.action) {
    case 'show':
    ShowNlocation()
    break;
    case 'hide':
    HideNlocation()
    break
}
})

function ShowNlocation() {

  $('.container').fadeIn()
  openUI = true
}

function HideNlocation() {

$('.container').fadeOut()
openUI = false
}

 
 $(document).ready(function () {
    window.addEventListener("message", function (event) {
      if (event.data.type == "menu") {
        event.data.status
          ? (document.body.style.opacity = "1")
          : (document.body.style.opacity = "0");

    

        }
      });
    });

  

  
  function closemenu() {
    $('.container').fadeOut()
    $.post(`https://Nlocation/closeMenu`);
    openUI = false
    
  }

function car1() {
  $.post('https://Nlocation/ShowLouerCar1');
  $('.container').fadeOut()
}

function car2() {
  $('.container').fadeOut();
  $.post('https://Nlocation/ShowLouerCar2')
}

function car3() {
  $('.container').fadeOut();
  $.post('https://Nlocation/ShowLouerCar3')
}

function car4() {
  $('.container').fadeOut();
  $.post('https://Nlocation/ShowLouerCar4')
}

  document.addEventListener("keydown", function (event) {
    if (event.key === "Escape") {
      closemenu();
    }
  });






  
  