window.onload = function () {
  let cars = localStorage.getItem("cars");

  let likeCarList = document.querySelector("#like-car-list");

  likeCarList = document.getElementById("like-car-list");

  if (cars === null) {
    likeCarList.innerText = "아직 찜한 자동차가 없습니다...";
  } else {
    cars = JSON.parse(cars);

    let likeCarListHtml = document.createElement("ul");
    for (let i = 0; i < cars.length; i++) {
      likeCarListHtml.innerHTML += `<li>${cars[i]["VIN"]} | ${cars[i]["modelName"]} | ${cars[i]["color"]} | ${cars[i]["mileage"]}</li>`;
    }

    likeCarList.appendChild(likeCarListHtml);
  }

  // ajax를 위한 객체 생성
  const xhr = new XMLHttpRequest;
  const method = "GET";
  // 데이터 경로 입력.
  const url = "./data/car.json";

  // 요청을 초기화 하기 위한 메서드
  xhr.open(method, url);
  // 헤더 정보 초기화 메서드
  xhr.setRequestHeader("Content-Type", "application/text");

  // 객체 상태 변화 이벤트 핸들러 함수 정의
  xhr.onreadystatechange = function () {
    // 데이터를 모두 수신하였다면
    if (xhr.readyState === 4) {
      // 상태코드가 성공일때
      if (xhr.status === 200) {
        const resJson = JSON.parse(xhr.responseText);
        const carData = resJson.cars;
        let carList = document.querySelector(".content-car-list-ul");
        for (let i = 0; i < carData.length; i++) {
          let carItem = `
            <li>
              <div class="list-item">
                <div>
                  <img src="${carData[i]["img"]}" alt='' />
                </div>
                <div class="car-info">
                  <div>
                    <div>${carData[i]["VIN"]}</div>
                    <div>${carData[i]["modelName"]}</div>
                    <div>${carData[i]["color"]}</div>
                    <div>${carData[i]["mileage"]} km</div>
                  </div>
                  <button class="like-btn">찜</button>
                </div>
              </div>
            </li>
            `;
          carList.innerHTML += carItem;
        }
      }
    }
  };
  // 요청 보내기
  xhr.send();

  // ES6 fetch를 사용한 비동기 통신
  // fetch("data/car.json", {
  //   method: "get",
  // })
  //   .then((response) => {
  //     const responseJson = response.json();
  //     console.log(responseJson);
  //     return responseJson;
  //   })
  //   .then((data) => {
  //     let carData = data.cars;
  //     let carList = document.querySelector(".content-car-list-ul");
  //     for (let i = 0; i < carData.length; i++) {
  //       let carItem = `
  //         <li>
  //           <div class="list-item">
  //             <div>
  //               <img src="${carData[i]["img"]}" alt='' />
  //             </div>
  //             <div class="car-info">
  //               <div>
  //                 <div>${carData[i]["VIN"]}</div>
  //                 <div>${carData[i]["modelName"]}</div>
  //                 <div>${carData[i]["color"]}</div>
  //                 <div>${carData[i]["mileage"]} km</div>
  //               </div>
  //               <button class="like-btn">찜</button>
  //             </div>
  //           </div>
  //         </li>
  //         `;
  //       carList.innerHTML += carItem;
  //     }
  //   })
  //   .catch((exception) => {
  //     console.log(exception);
  //   });
};
// 동적으로 생성된 버튼에는 이벤트 등록이 안됨 (정확히 말하면 동적으로 생성하는 스코프 안에서 등록 해야함)
// 부모 요소에 이벤트 리스터 등록 (버블링)
const contentCarList = document.querySelector(".content-car-list-ul");

// 긱 요소를 돌면서 해당 버튼에 클릭 이벤트 달기
contentCarList.addEventListener("click", function (event) {
  // 구조에 따라 달라질 수도 있음.
  // 찜하기 버튼이 아니라면 동작 X
  if (event.target.className !== "like-btn") return;

  const data = event.target.parentElement.innerText.split("\n");

  const cars = {
    VIN: data[0],
    modelName: data[1],
    color: data[2],
    mileage: data[3],
  };

  let localCars = localStorage.getItem("cars");

  if (localCars === null) {
    localCars = [cars];
  } else {
    localCars = JSON.parse(localCars);
    localCars.push(cars);
  }

  const carsJson = JSON.stringify(localCars);
  localStorage.setItem("cars", carsJson);
});
