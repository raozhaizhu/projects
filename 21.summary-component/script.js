const imgs = document.querySelectorAll('.score-progress img');
const colorPs = document.querySelectorAll('.color-p');
const summarys = document.querySelectorAll('.summary');

fetch('./data.json')
    .then((response) => response.json())
    .then((data) => {
        imgs.forEach((img, index) => {
            img.src = data[index].icon;
        });
        colorPs.forEach((colorP, index) => {
            colorP.textContent = data[index].category;
        });
        summarys.forEach((summary, index) => {
            summary.textContent = data[index].score;
        });
    })
    .catch((error) => console.error(error));
