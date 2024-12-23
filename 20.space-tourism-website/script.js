const planetImg = document.querySelector('.planet-img');
const planetInfoContents = document.querySelectorAll('.planet-info-content');
const [moon, mars, europa, titan] = planetInfoContents;
const planetBtns = document.querySelectorAll('.planet-btn');
const [moonBtn, marsBtn, europaBtn, titanBtn] = planetBtns;

const planetSwitch = (planetName) => {
    planetInfoContents.forEach((content) => {
        content.classList.remove('flex-active');
    });
    planetBtns.forEach((btn) => {
        btn.classList.remove('pressed');
    });
    switch (planetName) {
        case 'moon':
            planetImg.src = 'destination/image-moon.png';
            moon.classList.add('flex-active');
            moonBtn.classList.add('pressed');
            break;
        case 'mars':
            planetImg.src = 'destination/image-mars.png';
            mars.classList.add('flex-active');
            marsBtn.classList.add('pressed');
            break;
        case 'europa':
            planetImg.src = 'destination/image-europa.png';
            europa.classList.add('flex-active');
            europaBtn.classList.add('pressed');
            break;
        case 'titan':
            planetImg.src = 'destination/image-titan.png';
            titan.classList.add('flex-active');
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
        content.classList.remove('now-active');
        content.classList.remove('flex-active');
    });
    switch (tabName) {
        case 'home':
            homeTab.classList.add('now-active');
            break;
        case 'destination':
            destinationTab.classList.add('flex-active');
            break;
        case 'crew':
            crewTab.classList.add('now-active');
            break;
        case 'technology':
            technologyTab.classList.add('now-active');
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
    if (homeTab.classList.contains('now-active')) activeTab = 'home';
    else if (destinationTab.classList.contains('flex-active')) activeTab = 'destination';
    else if (crewTab.classList.contains('now-active')) activeTab = 'crew';
    else if (technologyTab.classList.contains('now-active')) activeTab = 'technology';

    if (activeTab) {
        main.style.backgroundImage = `url(${backgrounds[activeTab]}-${size}.jpg)`;
    }
};
const addEventListeners = () => {
    window.addEventListener('resize', setBackgroundImage);
};
addEventListeners();
