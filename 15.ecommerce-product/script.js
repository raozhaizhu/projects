function openSidebar() {
    document.getElementById('sidebar').style.display = 'block';
}
function closeSidebar() {
    document.getElementById('sidebar').style.display = 'none';
}

function openModal() {
    document.getElementById('modal-lightbox').style.display = 'flex';
}

function closeModal() {
    document.getElementById('modal-lightbox').style.display = 'none';
}

function validateInput() {
    const inputElement = document.getElementById('numberInput');
    let value = inputElement.value;

    const regex = /^(?:[1-9][0-9]{0,2}|500)$/;

    // 如果输入匹配正则表达式，值是有效的
    if (regex.test(value)) {
        // 转换为整数
        value = parseInt(value, 10);
        // 如果在合法范围内，则保留值
        if (value < 0) {
            inputElement.value = 0;
        } else if (value > 500) {
            inputElement.value = 500;
        } else {
            inputElement.value = value; // 保持原值
        }
    } else {
        // 如果输入无效，重置为0
        inputElement.value = 0;
    }
}

function deleteItem() {
    const cartItemsContainer = document.getElementById('cart-items-container');
    const cartItem = cartItemsContainer.lastElementChild;
    cartItemsContainer.removeChild(cartItem);
}

document.addEventListener('DOMContentLoaded', function () {
    var slideIndex = 1; // 确保 slideIndex 被正确初始化

    const showSlides = (n) => {
        var i;
        const originSlides = document.querySelectorAll('.slideshow.origin');
        const modalSlides = document.querySelectorAll('.slideshow.gogo');
        const originDots = document.querySelectorAll('.dot.origin');
        const modalDots = document.querySelectorAll('.dot.gogo');

        if (n > originSlides.length) {
            slideIndex = 1; // 如果超过最大索引，返回第一个幻灯片
        }
        if (n < 1) {
            slideIndex = originSlides.length; // 如果小于最小索引，返回最后一个幻灯片
        }

        // 隐藏所有幻灯片
        for (i = 0; i < originSlides.length; i++) {
            originSlides[i].style.display = 'none';
            modalSlides[i].style.display = 'none';
        }

        // 显示当前幻灯片
        if (originSlides[slideIndex - 1]) {
            originSlides[slideIndex - 1].style.display = 'block';
            modalSlides[slideIndex - 1].style.display = 'block';
        }

        // 移除所有点的 'demo' 类
        for (i = 0; i < originDots.length; i++) {
            originDots[i].classList.remove('demo');
            modalDots[i].classList.remove('demo');
        }

        // 为当前点添加 'demo' 类
        if (originDots[slideIndex - 1]) {
            originDots[slideIndex - 1].classList.add('demo');
            modalDots[slideIndex - 1].classList.add('demo');
        }
    };

    const plusSlides = (n) => {
        showSlides((slideIndex += n));
    };

    const currentSlide = (n) => {
        showSlides((slideIndex = n));
    };

    showSlides(slideIndex); // 初始显示第一张幻灯片

    // Expose methods to global scope if needed
    window.plusSlides = plusSlides;
    window.currentSlide = currentSlide;
});

const increaseValue = () => {
    const numberInput = document.getElementById('numberInput');
    numberInput.value = parseInt(numberInput.value) + 1;
};

const decreaseValue = () => {
    const numberInput = document.getElementById('numberInput');
    numberInput.value = parseInt(numberInput.value) - 1;
};
const toggleCart = () => {
    const cart = document.getElementById('cart');

    cart.classList.toggle('show');
};
const addItemToCart = () => {
    const cartItemsContainer = document.getElementById('cart-items-container');
    const inputQuantity = document.getElementById('numberInput').value;

    // Check if the quantity is valid
    if (parseInt(inputQuantity) <= 0) {
        alert('Please enter a valid quantity.');
        return;
    }

    const findExistingCartItem = (productName) => {
        const existingCartItems = cartItemsContainer.getElementsByClassName('cart-item');
        for (let item of existingCartItems) {
            const itemName = item.querySelector('.cart-item-name').textContent.trim();
            if (itemName.includes(productName)) {
                return item; // Found the existing item, return it
            }
        }
        return null; // No existing item found
    };

    const createCartItem = () => {
        const cartItem = document.createElement('div');
        cartItem.classList.add('cart-item');
        const product = {
            img: `images/image-product-1.jpg`,
            name: `Fall Limited Edition Sneakers`,
            price: 125,
            quantity: parseInt(inputQuantity),
        };

        const totalPrice = (product.price * product.quantity).toFixed(2);

        cartItem.innerHTML = `
          <div class="cart-item-image">
                <img src="${product.img}" alt="${product.name}" class="cart-item-img">
          </div>
          <p class="cart-item-name">
                 ${product.name}
                            <span>$${product.price} x ${product.quantity}</span>
                            <span class="total-price">$${totalPrice}</span>
          </p>`;
        return cartItem;
    };

    // Check for existing cart item
    const existingItem = findExistingCartItem('Fall Limited Edition Sneakers');

    if (existingItem) {
        const quantitySpan = existingItem.querySelector('.cart-item-name span:nth-child(1)');
        const totalPriceSpan = existingItem.querySelector('.total-price');

        const currentQuantity = parseInt(quantitySpan.textContent.split(' x ')[1]); // Get current quantity
        const newQuantity = currentQuantity + parseInt(inputQuantity); // New quantity
        const newTotalPrice = (125 * newQuantity).toFixed(2); // Calculate new total price

        // Update quantity and total price text content
        quantitySpan.textContent = `$125 x ${newQuantity}`;
        totalPriceSpan.textContent = `$${newTotalPrice}`;
    } else {
        // If no existing item, create and append a new cart item
        const newCartItem = createCartItem();
        cartItemsContainer.appendChild(newCartItem);
    }
    const cart = document.getElementById('cart');
    if (!cart.classList.contains('show')) {
        toggleCart();
    }
};

