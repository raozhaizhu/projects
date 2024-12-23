const infos = document.querySelectorAll('.info');
const goCollapse = (infoIndex) => {
    infos.forEach((item) => {
        item.classList.remove('active-item');
    });
    infos[infoIndex].classList.add('active-item');
};

function toggleQa(index) {
    const qas = document.querySelectorAll('.qa');
    qas.forEach((qa, i) => {
        if (i === index) {
            qa.classList.toggle('active-qa');
        } else {
            qa.classList.remove('active-qa');
        }
    });
}

