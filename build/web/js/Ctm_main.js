// tìm kiếm
let search = document.querySelector('.search-box');
document.querySelector('#search-icon').onclick = () => {
    search.classList.toggle('active');
}

//slider
let list = document.querySelector('.slider .list');
let items = document.querySelectorAll('.slider .list .item');
let dots = document.querySelectorAll('.slider .dots li');
let prev = document.getElementById('prev');
let next = document.getElementById('next');

let active = 0;
let lengthItems = items.length - 1;

next.onclick = function(){
    if(active + 1 > lengthItems){
        active = 0;
    }else{
        active = active + 1;
    }
    reloadSlider();
}
prev.onclick = function(){
    if(active - 1 <0){
        active = lengthItems;
    }else{
        active = active -1;
    }
    reloadSlider();
}
let refeshSlider = setInterval(()=> {next.click()}, 3000);
function reloadSlider(){
    let checkLeft = items[active].offsetLeft;
    list.style.left = -checkLeft + 'px';

    let lastActiveDot = document.querySelector('.slider .dots li.active');
    lastActiveDot.classList.remove('active');
    dots[active].classList.add('active');
    clearInterval(refeshSlider);
    refeshSlider = setInterval(()=> {next.click()}, 3000);
}
dots.forEach((li, key) => {
    li.addEventListener('click', function(){
        active = key;
        reloadSlider();
    })
})

// navbar toggle(menu 420px)
let navBar = document.querySelector('.navLink');
let menuBar = document.querySelector('#menuBtn');

menuBar.onclick = () =>{
    navBar.classList.toggle('active');
}
// show automatic
const popup = document.querySelector('.popup');
const close = document.querySelector('.close');
window.onload = function() {
    setTimeout(function(){
        popup.style.display = "block";

        // add some time delay to show popup
    }, 2000)
}
close.addEventListener('click', () =>{
    popup.style.display = "none";
})

//danh gia client
var swiper = new Swiper(".myClient", {
    slidesPerView: 1,
    spaceBetween: 10,
    centeredSlides: true,
    loop: true,
    autoplay: {
        delay: 3000,
        disableOnInteraction: false,
    },
    breakpoints: {
        640: {
            slidesPerView: 1,
            spaceBetween: 20,
        },
        768: {
            slidesPerView: 2,
            spaceBetween: 40,
        },
        1024: {
            slidesPerView: 3,
            spaceBetween: 50,
        },
    },
});