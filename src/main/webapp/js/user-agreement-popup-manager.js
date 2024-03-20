/**
 * This script manages the popup window when a user has not accepted the terms of use yet.
 * It will grab the popup banner element and overlay element
 * */
const $cookiesBanner = document.querySelector(".cookies-banner");
const $cookiesBannerButton = $cookiesBanner.querySelector("button");
const cookieName = "cookiesBanner";
const hasCookie = getCookie(cookieName);
const $cookieOverlay = document.getElementById("agreement-overlay")

if (!hasCookie) {
    $cookiesBanner.classList.remove("hidden");
} else {
    $cookieOverlay.style.display = "none";
}

$cookiesBannerButton.addEventListener("click", () => {
    setCookie(cookieName, "closed");
    $cookiesBanner.remove();
    $cookieOverlay.style.display = "none";
});