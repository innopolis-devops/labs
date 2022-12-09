window.onload = function () {
  setInterval(function () {
    const time = document.getElementById("time");

    const date = new Date();
    const hours = date.getHours();
    const minutes = date.getMinutes();
    const seconds = date.getSeconds();

    time.innerHTML = `${hours}:${minutes}:${seconds}`;
  }, 1000);
};
