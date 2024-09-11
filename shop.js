window.addEventListener('resize', function() {
    if (window.innerWidth <= 500) {
        document.getElementById('headertitle').innerHTML = "SG"
    }else{
        document.getElementById('headertitle').innerHTML = "Smart Grocery"
    }
});

// Also check when the page loads
if (window.innerWidth <= 500) {
    document.getElementById('headertitle').innerHTML = "SG"
}else{
    document.getElementById('headertitle').innerHTML = "Smart Grocery"
}

let list = document.querySelector(".slider .list");
let items = document.querySelectorAll(".slider .list .item");
let dots = document.querySelectorAll(".slider .dots li");
let prev = document.getElementById("prev");
let next = document.getElementById("next");

let active = 0;
let lengthItems = items.length - 1;

next.onclick = function () {
  if (active + 1 > lengthItems) {
    active = 0;
  } else {
    active = active + 1;
  }
  reloadSlider();
};
prev.onclick = function () {
  if (active - 1 < 0) {
    active = lengthItems;
  } else {
    active = active - 1;
  }
  reloadSlider();
};

let refreshSlider = setInterval(() => {
  next.click();
}, 5000);

function reloadSlider() {
  let checkLeft = items[active].offsetLeft;
  list.style.left = -checkLeft + "px";

  let lastActiveDot = document.querySelector(".slider .dots li.active");
  lastActiveDot.classList.remove("active");
  dots[active].classList.add("active");
  clearInterval(refreshSlider);
  refreshSlider = setInterval(() => {
    next.click();
  }, 5000);
}

dots.forEach((li, key) => {
  li.addEventListener("click", function () {
    active = key;
    reloadSlider();
  });
});

// Main section slider

let listMain = document.querySelector(".slider-main .list-main");
let itemsMain = document.querySelectorAll(".slider-main .list-main .item-main");
let dotsMain = document.querySelectorAll(".slider-main .dots-main li");
let prevMain = document.getElementById("prev-main");
let nextMain = document.getElementById("next-main");

let activeMain = 0;
let lengthItemsMain = itemsMain.length - 1;

// nextMain.onclick = function () {
//   if (activeMain + 1 > lengthItemsMain) {
//     activeMain = 0;
//   } else {
//     activeMain = activeMain + 1;
//   }
//   reloadSliderMain();
// };
// prevMain.onclick = function () {
//   if (activeMain - 1 < 0) {
//     activeMain = lengthItemsMain;
//   } else {
//     activeMain = activeMain - 1;
//   }
//   reloadSliderMain();
// };

// let refreshSliderMain = setInterval(() => {
//   nextMain.click();
// }, 5000);

function reloadSliderMain() {
  let checkLeftMain = itemsMain[activeMain].offsetLeft;
  listMain.style.left = -checkLeftMain + "px";

  let lastActiveDotMain = document.querySelector(".slider-main .dots-main li.active-main");
  lastActiveDotMain.classList.remove("active-main");
  dotsMain[activeMain].classList.add("active-main");
  clearInterval(refreshSliderMain);
  refreshSliderMain = setInterval(() => {
    nextMain.click();
  }, 5000);
}

dotsMain.forEach((li, key) => {
  li.addEventListener("click", function () {
    activeMain = key;
    reloadSliderMain();
  });
});

