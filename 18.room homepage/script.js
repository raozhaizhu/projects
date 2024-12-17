let slideIndex = 1;
document.addEventListener('DOMContentLoaded', function () {
    showSlides(slideIndex); // 在页面完全加载后执行
});

// Next/previous controls
function plusSlides(n) {
    showSlides((slideIndex += n));
}

// Thumbnail image controls
function currentSlide(n) {
    showSlides((slideIndex = n));
}

function showSlides(n) {
    let i;
    let slides = document.getElementsByClassName('mySlides');
    let articles = document.getElementsByClassName('myArticles');

    if (n > slides.length) {
        slideIndex = 1;
    }
    if (n < 1) {
        slideIndex = slides.length;
    }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = 'none';
        articles[i].style.display = 'none';
    }
    slides[slideIndex - 1].style.display = 'block';
    articles[slideIndex - 1].style.display = 'block';
}

