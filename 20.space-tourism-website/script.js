const planetImg = document.querySelector('.planet-img');
const planetInfoContents = document.querySelectorAll('.planet-info-content');
const [moon, mars, europa, titan] = planetInfoContents;
const planetBtns = document.querySelectorAll('.planet-btn');
const [moonBtn, marsBtn, europaBtn, titanBtn] = planetBtns;

const planetSwitch = (planetName) => {
    planetInfoContents.forEach((content) => {
        content.hidden = true;
    });
    planetBtns.forEach((btn) => {
        btn.classList.remove('pressed');
    });
    switch (planetName) {
        case 'moon':
            planetImg.src = 'destination/image-moon.png';
            moon.hidden = false;
            moonBtn.classList.add('pressed');
            break;
        case 'mars':
            planetImg.src = 'destination/image-mars.png';
            mars.hidden = false;
            marsBtn.classList.add('pressed');
            break;
        case 'europa':
            planetImg.src = 'destination/image-europa.png';
            europa.hidden = false;
            europaBtn.classList.add('pressed');
            break;
        case 'titan':
            planetImg.src = 'destination/image-titan.png';
            titan.hidden = false;
            titanBtn.classList.add('pressed');
            break;
    }
};

const tabContents = document.querySelectorAll('.tab-content');
const [homeTab, destinationTab, crewTab, technologyTab] = tabContents;
const tabBtns = document.querySelectorAll('.tab-btn');
const [homeBtn, destinationBtn, crewBtn, technologyBtn] = tabBtns;
const main = document.querySelector('main');

const tabSwitch = (tabName) => {
    tabContents.forEach((content) => {
        content.hidden = true;
    });
    switch (tabName) {
        case 'home':
            homeTab.hidden = false;
            break;
        case 'destination':
            destinationTab.hidden = false;
            break;
        case 'crew':
            crewTab.hidden = false;
            break;
        case 'technology':
            technologyTab.hidden = false;
            break;
    }
    setBackgroundImage();
};

const setBackgroundImage = () => {
    const width = window.innerWidth;
    const backgrounds = {
        home: 'home/background-home',
        destination: 'destination/background-destination',
        crew: 'crew/background-crew',
        technology: 'technology/background-technology',
    };
    const size = width < 768 ? 'mobile' : width < 1024 ? 'tablet' : 'desktop';

    let activeTab = null;
    if (homeTab.hidden === false) activeTab = 'home';
    else if (destinationTab.hidden === false) activeTab = 'destination';
    else if (crewTab.hidden === false) activeTab = 'crew';
    else if (technologyTab.hidden === false) activeTab = 'technology';

    if (activeTab) {
        main.style.backgroundImage = `url(${backgrounds[activeTab]}-${size}.jpg)`;
    }
};
const addEventListeners = () => {
    window.addEventListener('resize', setBackgroundImage);
};
addEventListeners();

