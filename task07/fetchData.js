const API_KEY = '998767bc596baf03801aee2e9854a831';

function fetchWeatherData(location) {
  const apiUrl = `https://api.openweathermap.org/data/2.5/weather?q=${location}&units=metric&appid=${API_KEY}`;

  fetch(apiUrl)
    .then((response) => {
      if (!response.ok) {
        throw new Error("Location not found");
      }
      return response.json();
    })
    .then((jsonData) => {
      document.getElementById("error-message").style.display = "none"; // Hide any previous error message
      document.getElementById("text_location").textContent = jsonData.name;
      document.getElementById("text_location_country").textContent = jsonData.sys.country;
      document.getElementById("text_temp").textContent = Math.round(jsonData.main.temp);
      document.getElementById("text_feelslike").textContent = Math.round(jsonData.main.feels_like);
      document.getElementById("text_desc").textContent = jsonData.weather[0].description;

      const iconCode = jsonData.weather[0].icon;
      const iconUrl = `http://openweathermap.org/img/w/${iconCode}.png`;
      document.getElementById("icon").src = iconUrl;
    })
    .catch((error) => {
      document.getElementById("error-message").textContent = "Sorry, this place isn't found.";
      document.getElementById("error-message").style.display = "block"; // Display the error message
    });
}

const searchButton = document.getElementById("search-button");
searchButton.addEventListener("click", () => {
  const locationInput = document.getElementById("search-input").value;
  fetchWeatherData(locationInput);
});


fetchWeatherData("Kollam");
