window.onload = function(){
  //영화 목록 가져오기
  let movies = localStorage.getItem("movies");
  //찜한 영화 목록
  let likeMovieList = document.querySelector(".movie-like-list")
  console.log(likeMovieList)

  if(movies === null){
    likeMovieList.innerText = "아직 찜한 영화가 없습니다."

  }else{
    movies = JSON.parse(movies);

    let likeMovieListHTML = document.createElement("ul");
    for(let i=0;i<movies.length;i++){
      likeMovieList.innerHTML += `<li>${movies[i]["title"]}</li>`
    }

    likeMovieList.appendChild(likeMovieListHTML);
  }
  const url = "data/movie.json";
  fetch(url)
  .then((response)=>{
    const responseJson =response.json();
    console.log(responseJson);
    return responseJson;
  })
  .then((data) =>{
    let movieData = data.movies;
    let movieList = document.querySelector(".content-movie-ul");
    for(let i=0;i<movieData.length;i++){
      let movieItem = `
      <li>
        <div class="list-item">
          <div>
            <img src = "${movieData[i]["img"]}" alt=''/>
          </div>
          <div class="movie-info">
            <div>
              <div>${movieData[i]["title"]}</div>
              <div>${movieData[i]["genre"]}</div>
              <div>${movieData[i]["director"]}</div>
              <div>${movieData[i]["runningTime"]}</div>
            </div>
            <button class = "like-btn">찜</button>
          </div>
        </div>
      </li>  
      `;
      movieList.innerHTML += movieItem;
    }
  })
  .catch((exception) => {
    console.log(exception);
  });
};

const contentMovieList = document.querySelector(".content-movie-ul");
document.querySelector(".like-btn").addEventListener("click",function(event){
    const title = event.parentElement.querySelector("div > div");
    console.log(1);

})
// contentMovieList.addEventListener("click", function(event){
  
//   if(event.target.className !== "like-btn") return;

//   const data = event.target.parentElement.innerText.split("\n");

//   const movies = {
//     title: data[0],
//     genre: data[1],
//     director: data[2],
//     runningTime: data[3],
//   };

//   let localMovies = localStorage.getItem("movies");

//   if(localMovies === null){
//     localMovies = [movies];
//   }else{
//     localMovies = JSON.parse(localMovies);
//     localMovies.push(movies);
//   }

//   const moviesJson = JSON.stringify(localMovies);
//   localStorage.setItem("movies",moviesJson);

// });