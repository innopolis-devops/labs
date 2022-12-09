function getMoscowTime() {
  const date = new Date();
  const hours = date.getHours();
  const minutes = date.getMinutes();
  const seconds = date.getSeconds();

  return { hours, minutes, seconds };
}

window.onload = function () {
  setInterval(function () {
    const time = document.getElementById("time");

    const { hours, minutes, seconds } = getMoscowTime();

    time.innerHTML = `${hours}:${minutes}:${seconds}`;
  }, 1000);
};
