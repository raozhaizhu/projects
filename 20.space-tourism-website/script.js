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

    const tabs = [homeTab, destinationTab, crewTab, technologyTab];
    const tabNames = ['home', 'destination', 'crew', 'technology'];

    let activeTab = tabNames.find((_, index) => !tabs[index].hidden) || null;

    if (activeTab) {
        main.style.backgroundImage = `url(${backgrounds[activeTab]}-${size}.jpg)`;
    }
};

const crewCards = document.querySelectorAll('.crew-card');
const [commanderCard, pilotCard, engineerCard, specialistCard] = crewCards;
const dots = document.querySelectorAll('.dot');
const crewPic = document.querySelector('.crew-pic');
const crewImages = {
    commander: 'crew/image-douglas-hurley.png',
    pilot: 'crew/image-victor-glover.png',
    engineer: 'crew/image-anousheh-ansari.png',
    specialist: 'crew/image-mark-shuttleworth.png',
};
const switchCrew = (crewName) => {
    crewCards.forEach((card) => {
        card.hidden = true;
    });
    dots.forEach((dot) => {
        dot.classList.remove('be-focused');
    });
    switch (crewName) {
        case 'commander':
            commanderCard.hidden = false;
            dots[0].classList.add('be-focused');
            crewPic.src = crewImages['commander'];
            break;
        case 'pilot':
            pilotCard.hidden = false;
            dots[1].classList.add('be-focused');
            crewPic.src = crewImages['pilot'];
            break;
        case 'engineer':
            engineerCard.hidden = false;
            dots[2].classList.add('be-focused');
            crewPic.src = crewImages['engineer'];
            break;
        case 'specialist':
            specialistCard.hidden = false;
            dots[3].classList.add('be-focused');
            crewPic.src = crewImages['specialist'];
    }
};

const technologyContents = document.querySelectorAll('.technology-content');
const [vehicleContent, capsuleContent, spaceportContent] = technologyContents;
const technologyBtns = document.querySelectorAll('.technology-btn');
const [vehicleBtn, capsuleBtn, spaceportBtn] = technologyBtns;
const switchTechnology = (technologyName) => {
    const technologyPic = document.querySelector('.technology-pic');

    technologyContents.forEach((content) => {
        content.hidden = true;
    });
    technologyBtns.forEach((btn) => {
        btn.classList.remove('technology-btn-pressed');
    });
    switch (technologyName) {
        case 'vehicle':
            vehicleContent.hidden = false;
            vehicleBtn.classList.add('technology-btn-pressed');
            updateTechnologyPicture();
            break;
        case 'capsule':
            capsuleContent.hidden = false;
            capsuleBtn.classList.add('technology-btn-pressed');
            updateTechnologyPicture();
            break;

        case 'spaceport':
            spaceportContent.hidden = false;
            spaceportBtn.classList.add('technology-btn-pressed');
            updateTechnologyPicture();
            break;
    }
};
const updateTechnologyPicture = () => {
    const technologyPic = document.querySelector('.technology-pic');

    // 定义技术图片路径
    const picturePaths = {
        vehicle: 'technology/image-launch-vehicle',
        capsule: 'technology/image-space-capsule',
        spaceport: 'technology/image-spaceport',
    };

    // 找到当前激活的技术内容
    const activeIndex = Array.from(technologyContents).findIndex((content) => !content.hidden);
    const activeContent = Object.keys(picturePaths)[activeIndex];

    if (!activeContent) return; // 如果没有激活内容，则退出

    // 根据屏幕方向选择图片后缀
    const isPortrait = window.innerWidth > window.innerHeight;
    const suffix = isPortrait ? 'portrait' : 'landscape';

    // 更新图片路径和尺寸
    technologyPic.src = `${picturePaths[activeContent]}-${suffix}.jpg`;
};

openModal = () => {
    const modal = document.querySelector('.menu-modal');
    modal.style.display = 'flex';
};
closeModal = () => {
    const modal = document.querySelector('.menu-modal');
    modal.style.display = 'none';
};

const addEventListeners = () => {
    updateTechnologyPicture();
    setBackgroundImage();
    window.addEventListener('resize', setBackgroundImage);
    window.addEventListener('resize', updateTechnologyPicture);
    window.addEventListener('orientationchange', updateTechnologyPicture);
};
addEventListeners();
