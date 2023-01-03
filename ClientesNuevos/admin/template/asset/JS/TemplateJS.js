document.addEventListener("DOMContentLoaded", function(){
  document.querySelectorAll('.menu .nav-link').forEach(function(element){
    
    element.addEventListener('click', function (e) {

      let nextEl = element.nextElementSibling;
      let parentEl  = element.parentElement;	

        if(nextEl) {
            e.preventDefault();	
            let mycollapse = new bootstrap.Collapse(nextEl);
            
            if(nextEl.classList.contains('show')){
              mycollapse.hide();
            } else {
                mycollapse.show();
                // find other submenus with class=show
                var opened_submenu = parentEl.parentElement.querySelector('.submenu.show');
                // if it exists, then close all of them
                if(opened_submenu){
                  new bootstrap.Collapse(opened_submenu);
                }
            }
        }
    }); // addEventListener
  }) // forEach
}); 
// DOMContentLoaded  end


$('#btnCollapse').click(function () {
    $('#btnCollapse').hide()

    closeNav();
    $('#btnOpenNav').show();
});
$('#btnOpenNav').click(function () {
    $('#btnOpenNav').hide();

    openNav();
    $('#btnCollapse').show()
});

function openNav() {
    document.getElementById("sidebar-container").style.width = "15rem";
    //document.getElementById("main").style.marginLeft = "0px";
}

function closeNav() {
    document.getElementById("sidebar-container").style.width = "0";
    //document.getElementById("main").style.marginLeft = "0";
}