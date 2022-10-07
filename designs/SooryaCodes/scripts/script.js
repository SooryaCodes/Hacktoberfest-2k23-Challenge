let searchInput = document.querySelector(".search__input");
let searchBtn = document.querySelector(".search__btn");
let cardsContainer = document.querySelector(".cards");
let modal = document.querySelector(".modal");
let loader = document.querySelector(".loader");
/**
 * Search Action
 */
const handleSearch = (searchVal) => {
  let color = searchVal || searchInput.value.replace(" ", "i");
  searchInput.parentElement.classList.remove("search__bar--error");

  try {
    let colors = new Values(color).all();
    clearData();
    colors.forEach((col) => {
      let [r, g, b] = col.rgb;
      let hex = col.hex;

      cardsContainer.innerHTML += `<div class="card card__animate">
     <div class="card__color" style="background:#${hex};"></div>
     <div class="card__action flex aic jcsb">
       <button class="card__viewbtn button--icon no-bg flex aic jcsb" onclick="handleView(['#${hex}','rgb(${r}, ${g}, ${b})','rgba(${r}, ${g}, ${b}, ${
        col.alpha
      })','${RGBToHSL(r, g, b)}'])">
         <i class="ri-eye-line"></i> View
       </button>
       <button class="card__copybtn button--icon no-bg" onclick="copyColor('#${hex}')">
         <i class="ri-file-copy-line"></i>
       </button>
     </div>
     </div>`;

      tippy(".card__copybtn", toolTipOptions);
    });
  } catch (error) {
    searchInput.value != "" &&
      searchInput.parentElement.classList.add("search__bar--error");
  }
};

/**
 * Modal Action
 */
const handleView = (colorValues) => {
  tippy(".modal__copybtn", toolTipOptions);
  if (modal.classList.contains("modal--active")) {
    modal.children[0].classList.add("modal__animate--down");
    modal.classList.remove("modal--active");
    modal.children[0].classList.remove("modal__animate--up");
  } else {
    let modalColorValues = document.querySelectorAll(".modal__colorvalue");
    for (let i = 0; i < modalColorValues.length; i++) {
      modalColorValues[i].innerHTML = colorValues[i];
      modal.children[0].children[1].style.background = colorValues[0];
    }
    modal.children[0].classList.remove("modal__animate--down");
    modal.classList.add("modal--active");
    modal.children[0].classList.add("modal__animate--up");
  }
};

/**
 * Clear All Data
 */
const clearData = () => {
  cardsContainer.innerHTML = "";
};

/**
 * Color Picker Action
 */
const $colorPicker = document.getElementById("color-picker");

$colorPicker.addEventListener(
  "change",
  _.debounce((e) => {
    searchInput.value = e.detail.hex;
    handleSearch(e.detail.hex);
  }, 150)
);

/**
 * Color Copy Action
 */
const handleModalCopy = (e) => {
  let button = e.target.classList.contains("ri-file-copy-line")
    ? e.target.parentNode
    : e.target;
  let text = button.previousElementSibling.children[1].innerText;
  copyColor(text);
};

window.onload = () => {
  loader.remove();
  handleSearch();
};
