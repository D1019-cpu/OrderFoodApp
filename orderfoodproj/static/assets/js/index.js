const modalBtns = [...document.querySelectorAll('.dish-modal')];
const overlayElem = document.querySelector('.overlay');
const modalElem = document.querySelector('.modal');
const modalBody = document.getElementById('modal-body');
const modalTitle = document.getElementById('modal-title')
const submitModalBtn = document.getElementById('submit-modal');

overlayElem.addEventListener('click', () => {
    overlayElem.style.display = 'none';
    modalElem.classList.remove('show-modal');
});

modalBtns.forEach(modalBtn => modalBtn.addEventListener('click', () => {
    const closeModalBtn = document.querySelector('.btn-close');

    overlayElem.style.display = 'block';
    modalElem.classList.add('show-modal');

    closeModalBtn.addEventListener('click', () => {
        overlayElem.style.display = 'none';
        modalElem.classList.remove('show-modal');
    });

    const dataPk = modalBtn.getAttribute('data-pk');
    // console.log(dataPk);
    fetch(`/dishes/${dataPk}/`)
    .then(response => {
        return response.json();
    })
    .then(data => {
        // console.log(data.bundle);
        let dish = data.bundle.dish;
        let topings = data.bundle.topings;
        // console.log(dish);
        // console.log(topings);
        modalTitle.innerHTML = `${dish.name}`;
        modalBody.innerHTML = `
        <div class="d-flex" style="width: max-content;gap: 1.5rem;">
            <img src="${dish.url}" style="width: 150px;height: 150px;object-fit: cover;object-position: center;border-radius: 6px;" alt="${dish.name}">
            <div class="card-body">
                <h5 class="card-title">${dish.name}</h5>
                <p class="card-text">${dish.price} đ</p>
                <div>
                    <input id="dish-quantity" type="number" class="form-control" value="1" min="1" max="100" step="1" />
                </div>
            </div>
        </div>
        <div class="mb-3 mt-2">
            <label for="exampleFormControlTextarea1" class="form-label">Ghi chú</label>
            <textarea style="resize: none;" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
        </div>
        <div class="mb-1 mt-2">
            <label for="" class="form-label">Thêm</label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
            <label class="form-check-label" for="flexCheckDefault">
                Xúc Xích +10,000 đ
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>
            <label class="form-check-label" for="flexCheckChecked">
                Chả +5,000 đ
            </label>
        </div>
        `; // price ở trên có thể fix lấy từ button với data attribute
        submitModalBtn.innerHTML = `Thêm +${dish.price} đ`;

        document.getElementById('dish-quantity').addEventListener('change', () => {
            const quantity = document.getElementById('dish-quantity').value;
            submitModalBtn.innerHTML = `Thêm + ${parseFloat(dish.price)*parseFloat(quantity)}`;
        });

        submitModalBtn.addEventListener('click', () => {
            const csrfToken = document.getElementsByName('csrfmiddlewaretoken')[0].value;
            const quantity = document.getElementById('dish-quantity').value; 
            const note = document.getElementById('exampleFormControlTextarea1').value;
            // console.log(dish.url);
            fetch('/cart/add-to-cart/', {
                method: "POST",
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRFToken': csrfToken,
                },
                body: JSON.stringify({
                    'dish_id': dataPk,
                    'name': dish.name,
                    'quantity': quantity,
                    'note': note,
                    'price': parseInt(dish.price),
                    'total_price': parseFloat(dish.price)*parseInt(quantity),
                    'image_url': dish.url,
                })
            })
            .then(response => response.json())
            .then(data => {
                console.log(data);
                if (data.success) {
                    document.getElementById('cart-counter').innerHTML = `${data.total_dishes}`;
                    let FoodItem = modalBtn.closest('.food-item');
                    let orderBtn = FoodItem.querySelector('.btn-order');
                    orderBtn.classList.remove('d-none');
                    modalBtn.classList.add('d-none');
                    overlayElem.style.display = 'none';
                    modalElem.classList.remove('show-modal');
                }
            })
            .catch(error => console.error(error));
        });
    })
    .catch(error => console.error(error));

}));