window.onload = function () {
  let cars = localStorage.getItem("cars");

  let likeCarList = document.querySelector("#like-car-list");

  if (cars === null) {
    likeCarList.innerText = "아직 찜한 자동차가 없습니다...";
  } else {
    // 데이터가 있다면 가져온 cars를 Json으로 변경하기
    cars = JSON.parse(cars);

    let likeCarListHtml = document.createElement("ul");
    for (let i = 0; i < cars.length; i++) {
      likeCarListHtml.innerHTML += `<li>${cars[i]["VIN"]} | ${cars[i]["modelName"]} | ${cars[i]["color"]} | ${cars[i]["mileage"]}</li>`;
    }

    likeCarList.appendChild(likeCarListHtml);
  }
};

const btnList = document.querySelectorAll(".car-info > button");

btnList.forEach((btn) => {
  btn.addEventListener("click", function (event) {
    const data = event.target.parentElement.innerText.split("\n");

    const cars = {
      VIN: data[0],
      modelName: data[1],
      color: data[2],
      mileage: data[3],
    };

    // 로컬스토리지에 있는 cars 를 가져온다.
    let localCars = localStorage.getItem("cars");

    if (localCars === null) {
      localCars = [cars];
    } else {
      // cars가 있다면 Json 으로 변경
      localCars = JSON.parse(localCars);
      localCars.push(cars);
    }

    // 로컬스토리지에 저장하기 위해서는 문자열의 형태로만 저장할 수 있다.
    const carsJson = JSON.stringify(localCars);
    localStorage.setItem("cars", carsJson);
  });
});
