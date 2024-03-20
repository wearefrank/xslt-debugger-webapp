/**
 * A simple cookie manager script.
 * */
const getCookie = (name) => {
    const parts = document.cookie.split(name + "=");
    return parts.length < 2 ? undefined : parts.pop().split(";").shift();
};

const setCookie = function (name, value) {
    document.cookie = `${name}=${value}`;
};
