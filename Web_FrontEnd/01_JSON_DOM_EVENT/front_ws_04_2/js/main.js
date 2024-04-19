window.onload = function(){
    let movies = localStorage.getItem("movies")

    let LikeMovieList = document.querySelector("#like-movie-list");

    if(movies==null){
        LikeMovieList.innerText = "아직 찜한 영화가 없습니다...";
    }else{
        movies = JSON.parse(movies);
        
        let LikeMovieListHtml = document.createElement("ul");
        for(let i=0;i<movies.length;i++){
            LikeMovieListHtml.innerHTML += `<li>${movies[i]["title"]} | ${movies[i]["genre"]} | ${movies[i]["director"]} | ${movies[i]["runninTime"]}</li>`;
        }

        LikeMovieList.appendChild(LikeMovieListHtml);
    }
};

const btnList = document.querySelectorAll(".movie-info > button");

btnList.forEach((btn) => {
    btn.addEventListener("click", function (event){
        const data = event.target.parentElement.innerText.split("\n");

        const movies = {
            title : data[0],
            genre : data[1],
            director : data[2],
            runninTime : data[3],
        };

        let localMovies = localStorage.getItem("movies");

        if(localMovies === null){
            localMovies = [movies];
        }else{
            localMovies = JSON.parse(localMovies);
            localMovies.push(movies);
        }

        const movieJson = JSON.stringify(localMovies);
        localStorage.setItem("movies", movieJson);
    });
});